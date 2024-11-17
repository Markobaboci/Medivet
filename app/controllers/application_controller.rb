class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_navbar_partial
  before_action :set_current_user_clinics
  before_action :load_user_clinics

  private

  def set_navbar_partial
    @navbar_partial = current_user&.vet? ? "shared/header_navbar_vet" : "shared/header_navbar"
  end

  def set_current_user_clinics
    @current_user_clinics = current_user.clinics if user_signed_in?
  end

  def load_user_clinics
    @current_user_clinics = current_user.clinics if user_signed_in?
  end

  protected


  # Permit additional parameters for Devise sign-up
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  # end
  def configure_permitted_parameters

    # devise_parameter_sanitizer.permit(:sign_up, keys: [:is_vet, :role])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:is_vet, :role])

    # devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:description])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:description])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_vet, :role, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:is_vet, :role, :description])
  end
end
