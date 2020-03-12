class SessionsController < ApplicationController
	def new
		@user	= User.new()
	end

	def create
		@user = User.find_by_email(params[:user][:email])
		if(@user && @user.authenticate(params[:user][:password]))
			permanent_coockie
			retriver
			redirect_to login_path
		else 
			render html: 'Hello'
		end
	end

	private

	def session_paramns
		params.require(:user).permit(:token)
	end
end
