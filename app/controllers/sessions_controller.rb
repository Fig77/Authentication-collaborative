class SessionsController < ApplicationController
	def new
		@user	= User.new()
		if is_sign_in 
			redirect_to show_path
		end
	end

	def show
		@user
	end

	def create
		user = User.find_by_email(params[:user][:email])
		if(user && user.authenticate(params[:user][:password]))
			permanent_coockie user
			sign_in user
			redirect_to login_path
		else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
	end

	def destroy
		sign_out
		redirect_to login_path
	end

	private

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

	def is_sign_in
		!current_user.nil?
	end
end
