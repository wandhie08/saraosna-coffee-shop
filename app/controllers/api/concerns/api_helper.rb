module Api
  module Concerns
    module ApiHelper
      extend ActiveSupport::Concern

      def default_message
        {
          :ok => 'Success',
          :created => 'Resource created',
          :not_found => 'Resource not found',
          :bad_request => 'Bad request',
          :unauthorized => 'Unauthorized access',
          :unprocessable_entity => 'Bad request format',
          :resource_conflict => 'Resource already existed'
        }
      end

      # Shorthand method for returning json responses.
      #
      # @param code (symbol) - Rails status code symbols.
      # @param message (string) - Custom message.
      # @param args (Hash) - Additional parameters to be attached in the body.
      def responder(code=:ok, message=nil, args=nil)
        message ||= default_message[code]
        args ||= {}
        if code == 200
          return render json: {code: code, success: true, msg: message}.merge(args), status: code
        else
          return render json: {code: code, success: false, msg: message}.merge(args), status: code
        end
      end

    end
  end
end
