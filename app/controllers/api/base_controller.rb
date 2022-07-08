module Api
  
  class BaseController < ApplicationController
    include Api::Concerns::ApiHelper
    include Api::Concerns::ActAsApiRequest

    # layout false
    # respond_to :json

    # rescue_from Exception,                           with: :render_error unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid,         with: :render_record_invalid
    rescue_from ActionController::RoutingError,      with: :render_not_found
    rescue_from AbstractController::ActionNotFound,  with: :render_not_found
    rescue_from ActionController::ParameterMissing,  with: :render_parameter_missing

    def status
      render json: { online: true }
    end

    def index
      responder 200, 'Success', data: {name: APP_CONFIG['api_name'], version: APP_CONFIG['api_version']}
    end

    private

      def render_error(exception)
        raise exception if Rails.env.test?

        # To properly handle RecordNotFound errors in views
        if exception.cause.is_a?(ActiveRecord::RecordNotFound)
          return render_not_found(exception)
        end

        logger.error("==== Error Log #{exception}") # Report to your error managment tool here
        render json: { code: 500, msg: I18n.t('api.errors.server'), success: false, errors: exception }, status: 500 unless performed?
      end

      def render_not_found(exception)
        logger.info("==== Error Log #{exception}") # for logging
        render json: { code: 404, msg: I18n.t('api.errors.not_found'), success: false, errors: exception }, status: :not_found
      end

      def render_record_invalid(exception)
        logger.info(exception) # for logging
        render json: { code: 400, msg: exception.record.errors.as_json, success: false, errors: exceptione }, status: :bad_request
      end

      def render_parameter_missing(exception)
        logger.info(exception) # for logging
        render json: { code: 422, msg: I18n.t('api.errors.missing_param'), success: false, errors: exception }, status: :unprocessable_entity
      end
    
  end
  
end
