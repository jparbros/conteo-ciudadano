class Admin::SessionsController < Devise::SessionsController
  before_filter :authenticate_admin!
  layout 'login'
end
