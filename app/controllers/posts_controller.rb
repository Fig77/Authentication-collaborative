class PostsController < ApplicationController
  def index; end

  before_action do
    redirect_to login_path unless sign_in?
  end

  def new
    @post = Post.new
  end

  def create
  	
  end
end
