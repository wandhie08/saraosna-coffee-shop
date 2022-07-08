module Api
  class ServingMethodsController < BaseController
    before_action :set_admin_serving_method, only: [:show, :edit, :update, :destroy]

    # GET /admin/serving_methods
    # GET /admin/serving_methods.json
    def index
      responder(200, 'Ok', ServingMethodSerializer.new(ServingMethod.includes(:serving_types)))
      # render json: ServingMethodSerializer.new(ServingMethod.all)
    end

    # GET /admin/serving_methods/1
    # GET /admin/serving_methods/1.json
    def show
      responder(200, 'Ok', ServingMethodSerializer.new(@serving_method))
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_admin_serving_method
        @serving_method = ServingMethod.friendly.find_by(id: params[:id])
        return render_not_found(ActiveRecord::RecordNotFound) unless @serving_method.present?
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def admin_serving_method_params
        params.require(:serving_method).permit(:name, :image, :description, :slug)
      end
  end
end

