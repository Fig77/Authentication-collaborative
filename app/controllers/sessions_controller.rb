class SessionsController < ApplicationController
	def new
		@user	= User.new()
	end

	def create
		@user = User.find_by_email(params[:email])
		@user.authenticate(params[:password])
	end
end
