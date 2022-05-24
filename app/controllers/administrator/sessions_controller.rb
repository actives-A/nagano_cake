# frozen_string_literal: true

class Administrator::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :forced_customer_sign_out

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

   protected
     def after_sign_in_path_for(resource)
       administrator_orders_path
     end

     def after_sign_out_path_for(resource)
       administrator_session_path
     end

     def forced_customer_sign_out
        if customer_signed_in?
          sign_out
        end
     end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
