# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # include Accessible
  # skip_before_action :check_user, only: :destroy
  # before_action :check_admin
  # prepend_before_action :valify_captcha!, only: [:create]

  layout "admin_session"
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private

    def check_admin
      redirect_to root_path, alert: "You are not authorized to access this page." if current_user
    end

    # def valify_captcha!
    #   unless verify_rucaptcha?
    #     redirect_to new_admin_session_path, alert: t('rucaptcha.invalid')
    #     return
    #   end
    #   true
    # end

    # def verify_captcha
    #   redirect_to new_admin_session_path, alert: "Invalid Capctcha" unless verify_rucaptcha?(resource)
    # end
end
