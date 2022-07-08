module Api
  class CoffeeBeansController < BaseController
    before_action :set_coffee_bean, only: [:show, :edit, :update, :destroy]

    # GET /coffee_beans
    # GET /coffee_beans.json
    def index
      responder(200, 'Ok', CoffeeBeanSerializer.new(CoffeeBean.visible.includes(:recommendation)))
    end

    # GET /coffee_beans/1
    # GET /coffee_beans/1.json
    def show
      responder(200, 'Ok', CoffeeBeanSerializer.new(@coffee_bean))
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_coffee_bean
        @coffee_bean = CoffeeBean.visible.find_by(id: params[:id])
        return render_not_found(ActiveRecord::RecordNotFound) unless @coffee_bean.present?
      end

  end
end
