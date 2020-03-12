class SessionsController < ApplicationController
	def new
		@user	= User.new()
	end

	def create
		@user = User.find_by_email(params[:user][:email])
		if(@user && @user.authenticate(params[:user][:password]))
			temp = SecureRandom.urlsafe_base64
			temp = Digest::SHA1.hexdigest temp
			@user.update(:token => temp)
			render html: 'YES!' + temp.to_s
		else render html: 'Hello' + params[:user].inspect.to_s
		end
	end

	private

	def session_paramns
		params.require(:user).permit(:token)
	end
end
