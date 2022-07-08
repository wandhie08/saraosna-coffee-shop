class ApplicationController < ActionController::Base


  private

    def after_sign_in_path_for(resource)
      stored_location_for(current_admin) || admin_dashboard_path
    end

    def after_sign_out_path_for(resource)
      resource.eql?(:admin) ? new_admin_session_path : root_path
    end

end
