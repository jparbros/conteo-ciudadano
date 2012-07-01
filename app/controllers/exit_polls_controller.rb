class ExitPollsController < ApplicationController
  def create
    if current_user.can_vote? && params[:exit_poll_result]
      ExitPoll.create_vote(params[:exit_poll_result])
      current_user.voted!
      cookies['conteo_ciudadano_exit_poll'] = true
    end
    redirect_to root_url
  end
end
