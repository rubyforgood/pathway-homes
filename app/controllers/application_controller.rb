class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :check_for_expired_password, if: ->{ user_signed_in? && !devise_controller? }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :role
  end

  def check_for_expired_password
    if current_user.password_expired?
      flash[:alert] = "Your password has expired. Please reset it before continuing."
      redirect_to edit_user_registration_path
    end
  end
end
