class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Welcome, #{@user.name}! Now, lets fly--"
    else
      render :new
    end
  end

  def destroy
  end

  def users_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
