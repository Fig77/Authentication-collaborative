class SessionsController < ApplicationController
	def new
	end

	def create
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @session = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
