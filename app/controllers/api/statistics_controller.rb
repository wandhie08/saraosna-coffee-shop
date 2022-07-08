module Api
  class StatisticsController < BaseController

    def index
      @serving_type = ServingType.current_fav
      data = {
          coffee_beans: CoffeeBean.current_fav.select(:id, :name, :orders_count),
          serving_methods: {
            manual_brew: @serving_type.manual_brew.select(:id, :name, :orders_count),
            espresso_based: @serving_type.espresso_based.select(:id, :name, :orders_count)
          }
      }
      responder(200, 'OK', data)
    end

  end
end