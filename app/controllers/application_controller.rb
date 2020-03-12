class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	def permanent_coockie
		temp = SecureRandom.urlsafe_base64
		temp = Digest::SHA1.hexdigest temp
		@user.update(:token => temp)
		cookies.permanent[:remember_token] = temp
	end

	def setter
		if @user = User.find_by_token(cookies.permanent[:remember_token])
			render html: 'Congrats' + @user.inspect.to_s
		end
	end
end
