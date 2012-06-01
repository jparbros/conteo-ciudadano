class AuthenticationsController < ApplicationController

  def create
    render :text => request.env["omniauth.auth"].to_yaml 
    # omniauth = request.env["omniauth.auth"]
    # authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    # if authentication
    #   flash[:notice] = "Signed in successfully."
    #   sign_in_and_redirect(:user, authentication.user)
    # elsif current_user
    #   current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
    #   flash[:notice] = "Authentication successful."
    #   redirect_to authentications_url
    # else
    #   user = User.new
    #   user.apply_omniauth(omniauth)
    #   flash[:notice] = "Signed in successfully."
    #   sign_in_and_redirect(:user, user)
    # end
  end
end
