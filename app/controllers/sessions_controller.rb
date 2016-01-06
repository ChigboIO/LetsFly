class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(sessions_params[:email])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome back, #{current_user.name}"
    else
      redirect_to login_path, alert: "Incorrect username or password"
    end
  end

  def destroy
    user = current_user.name
    session[:user_id] = nil
    redirect_to root_url, notice: "See you again, #{user}!"
  end

  def sessions_params
    params.permit(:email, :password)
  end
end
