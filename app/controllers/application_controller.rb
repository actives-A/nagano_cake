class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    addresses_path
  end

  def after_sign_out_path_for(resource)
    new_customer_registration_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_namber, :email])
  end

end