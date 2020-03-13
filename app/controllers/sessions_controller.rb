class SessionsController < ApplicationController
  def new
    @user = User.new
    redirect_to show_path if sign_in?
  end

  def show
    @user
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user&.authenticate(params[:user][:password])
      permanent_coockie user
      sign_in user
      redirect_to root_path
    else
      danger
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

  private

  def danger
    email = params[:user][:email].split
    password = params[:user][:password].split
    flash[:danger] ||= []
    flash[:danger] << 'Invalid email/password combination' unless email.empty? || password.empty?
    flash[:danger] << 'email is empty' if email.empty?
    flash[:danger] << 'password is empty' if password.empty?
  end

  def session_paramns
    params.require(:user).permit(:token)
  end

  def sign_in(user)
    session[:user_id] = user.id
    session[:token] = user.token
  end

  def sign_out
    session.delete(:user_id)
    session.delete(:token)
    cookies.permanent[:remember_token] = ''
  end
end
