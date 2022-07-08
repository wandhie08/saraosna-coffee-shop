Rails.application.routes.draw do

  get :display,             to: 'display#index'
  get :tv,                  to: 'display#tv'
  mount ActionCable.server, at: '/cable'
  # root 'api/base#index'
  root 'orders#index'
  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]
  
  get :pickup, to: 'pickup#index'
  resources :orders, only: [:index, :show, :destroy] do
    member do
      post :confirm
      post :confirm_done
      post :call_order
      post :confirm_delivered
    end
    collection do
      get  :redis_orders
      get  :pickups
      post :clear_list
    end
  end


  namespace :admin do
    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index'

    resources :coffee_beans, path: 'coffee-beans'
    resources :serving_methods, path:'serving-methods', except: [:destroy]
    resources :serving_types, path:'serving-type', except: [:destroy]
    resources :parameters, except: [:destroy], path: 'settings'
    resources :backgrounds, except: [:destroy, :new, :create, :index]
    resources :front_images, path:'front-images'
    resources :orders do
      collection do
        post :truncate
        post :export
      end
    end
  end

  devise_for :admins, controllers: {
    sessions:  'admins/sessions'
  }

  namespace :api, defaults: {:format => :json} do
    resources :coffee_beans, path: 'coffee-beans', only: [:index, :show]
    resources :serving_methods, path:'serving-methods', only: [:index, :show]
    resources :orders, only: [:index, :show, :create]
    resources :backgrounds, only: [:index] do
      collection do
        post :random_image
        get :front_image
      end
    end
    get :home, to: 'home#index'
    get :statistics, to: 'statistics#index'
    get :pickups, to: 'pickups#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
