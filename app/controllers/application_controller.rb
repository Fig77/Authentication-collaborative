class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def permanent_coockie(user)
    temp = SecureRandom.urlsafe_base64
    temp = Digest::SHA1.hexdigest temp
    user.update(token: temp)
    cookies.permanent[:remember_token] = temp
  end

  def retriver
    @current_user ||= User.find_by_token(cookies.permanent[:remember_token]) unless sign_in?
  end

  def current_user
    user = User.find_by(token: cookies.permanent[:remember_token])
    @current_user ||= user unless user.nil? || user.token.nil?
  end
  helper_method :current_user

  def sign_in?
    !current_user.nil? || !cookies.permanent[:remember_token].nil?
  end
end
