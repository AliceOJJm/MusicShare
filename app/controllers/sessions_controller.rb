class SessionsController < ApplicationController
  def create
    @current_user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @current_user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
