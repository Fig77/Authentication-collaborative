class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_parms)
    if user.save
      permanent_coockie user
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_parms
    params.require(:user).permit(:email, :name, :password, :token)
  end
end
