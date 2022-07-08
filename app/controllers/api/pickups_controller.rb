module Api
  class PickupsController < BaseController

    def index
      @orders = Order.includes(:serving_method, :serving_type, :coffee_bean)
      @pickups = @orders.status_done.by_serving_time.limit(7)
      responses = {
        pickups: OrderSerializer.new(@pickups),
        servings: OrderSerializer.new(@orders.status_processing.latest)
      }
      responder(200, 'Ok', responses)
    end

  end
end