class SessionsController < ApplicationController

  def create
    token = GithubOauthService.request_token(params[:code])
    auth  = GithubOauthService.request_user(token)
    user = User.find_or_create_user(token, auth)

    session[:user_id] = user.id

    redirect_to root_path
  end
end
