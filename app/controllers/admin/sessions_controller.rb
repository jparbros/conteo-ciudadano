class Admin::SessionsController < Devise::SessionsController
  before_filter :authenticate_admin!
end
