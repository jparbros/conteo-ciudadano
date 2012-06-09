class ApplicationController < ActionController::Base
  protect_from_forgery
  #check_authorization :unless => :devise_controller?
  #include SimpleCaptcha::ControllerHelpers
  helper :all
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_root_path, :alert => exception.message
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
  
end