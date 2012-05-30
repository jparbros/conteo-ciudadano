class Admin::UserSessionsController < ApplicationController
  before_filter :require_no_user, :only=>[:new,:create]
  before_filter :require_user, :only => :destroy
  layout "login"

  def new
    @user_session = UserSession.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html {redirect_to '/admin', :notice=>"Bienvenido"}
      else
        format.html {render "new"}
      end
    end

  end

  def destroy
    current_user_session.destroy
    respond_to do |format|
      format.html {redirect_to :login}
    end
  end
end