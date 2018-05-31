class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :post_user, only: [:edit, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Great!"
      redirect_to posts_path
    else
      flash[:alert] = "There are some errors"
      render :new
    end
  end

  def update
    @post.update(post_params)
    flash[:notice] = "文章已修改完成"
    redirect_to post_path(@post)
  end

  def destroy
    @post.delete
    flash[:alert] = "文章已被刪除"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
