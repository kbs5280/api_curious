class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
          session[:user_id] = user.id
    end
    redirect_to profile_path(user.id)
  end

  def destroy
    session.clear
    flash[:notice] = 'Successfully logged out.'
    redirect_to root_path
  end
end
