class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :authenticate_admin!, :set_current_admin

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_root_path, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end

  def set_current_admin
    Admin.current = current_admin
  end
end
