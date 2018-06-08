class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show]

  def index
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
