class ApplicationController < ActionController::Base
   before_filter :configure_permitted_parameters, if: :devise_controller?

   include SimpleCaptcha::ControllerHelpers

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end

end
