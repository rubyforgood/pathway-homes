class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_filter :authenticate_user!
  after_filter :set_csrf_cookie_for_ng

  # If the user isn't authorized to do something, redirect them back to the home page
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :check_for_expired_password, if: ->{ user_signed_in? && !devise_controller? }

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :role
  end

  def check_for_expired_password
    if current_user.password_expired?
      flash[:alert] = "Your password has expired. Please reset it before continuing."
      redirect_to edit_user_path(current_user)
    end
  end
end
