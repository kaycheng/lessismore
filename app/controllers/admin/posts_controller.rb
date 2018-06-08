class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_post, only: [:show, :edit, :update, :destroy]
    
  def index
    @posts = Post.order(created_at: :desc)
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

  def update
    @post.update(post_params)
    flash[:notice] = "文章已修改完成"
    redirect_to admin_posts_path
  end

  def destroy
    @post.delete
    flash[:alert] = "文章已被刪除"
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
