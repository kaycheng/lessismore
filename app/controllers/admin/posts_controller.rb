class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_post, only: [:show]
    
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    flash[:notice] = "Great!"
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
