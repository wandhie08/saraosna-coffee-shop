module Api
  class HomeController < BaseController

    def index
      @orders = Order.all
      @serving = ServingType.current_fav.first
      data = {
          last_order: "#{@orders.last.coffee_bean.name} Served with #{@orders.last.serving_type.name}",
          coffee_served: @orders.status_done.size,
          current_favorite: {
            coffee_bean: CoffeeBean.current_fav.first.area,
            serving_method: "#{@serving.serving_method.name} with #{@serving.name}"
          }
      }
      responder(200, 'OK', data)
    end

  end
end