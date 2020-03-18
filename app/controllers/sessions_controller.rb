class SessionsController < ApplicationController
  def new
    @user = User.new
    redirect_to root_path if sign_in?
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user&.authenticate(params[:user][:password])
      permanent_coockie user
      redirect_to root_path
    else
      danger
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
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

  def sign_out
    user = User.find_by_token(cookies.permanent[:remember_token])
    user.update(token: nil)
    cookies.delete(:remember_token)
    @current_user = nil
  end
end
