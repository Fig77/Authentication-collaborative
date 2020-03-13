class PostsController < ApplicationController
  
  def index
  	@post = Post.all
  end
  
  before_action :action, except:[:index]

  def action
  	redirect_to login_path unless sign_in?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
         redirect_to root_path
      else
      	 redirect_to posts_path
      end
  end

  def findUser(id)
   	userName = User.find_by_id(id).name if sign_in?
  end
  helper_method :findUser

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id]) 
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:idUser, :content)
  end
end
