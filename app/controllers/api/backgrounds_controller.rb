module Api
  class BackgroundsController < BaseController
    
    def index
      # responder(200, 'Ok', BackgroundSerializer.new(Background.all, params: {status: $redis.get('coffee_app:random_image?')}))
      responder(200, 'Ok', BackgroundSerializer.new(Background.first))
    end

    def front_image
      image_path = if $redis.get('coffee_app:random_image?').eql? 'true'
        base_url + FrontImage.all.sample.image.url
      else
        base_url + FrontImage.published.last.image.url
      end
      render json: {image: image_path}
    end

    def random_image
      $redis.set('coffee_app:random_image?', params[:checked])
      render json: {message: "Success update random image to #{$redis.get('coffee_app:random_image?')}"}
    end

    def base_url
      if Rails.env.production?
        "https://coffeeapp.yana.work"
      else
        "http://localhost:7000"
      end
    end

  end
end