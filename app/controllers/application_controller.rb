class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	def permanent_coockie(user)
		temp = SecureRandom.urlsafe_base64
		temp = Digest::SHA1.hexdigest temp
		user.update(:token => temp)
		cookies.permanent[:remember_token] = temp
	end

	def retriver(user)
		user = User.find_by_token(cookies.permanent[:remember_token])
		redirect_to show_path unless user.nil?
	end

	def current_user
		if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
	end
end
