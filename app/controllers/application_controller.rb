class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_categories

  include SimpleCaptcha::ControllerHelpers

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end

  private
  def get_categories
    @categories = Category.all
  end

  def after_sign_in_path_for(resource)
    Action.create(:user_id=>current_user.id, :action_type=>"user_sign_in", :data => {:time=>Time.now,:description=>'Sign in',:id=>' ',:url=>' '})
    if resource.is_a? User
      root_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    Action.create(:user_id=>current_user.id, :action_type=>"user_sign_out", :data => {:time=>Time.now,:description=>'Sign out',:id=>' ',:url=>' '})
    if resource.is_a? User
      root_path
    else
      super
    end
  end

end
