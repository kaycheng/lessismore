class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to posts_path
    end
  end

  def post_user
    @post = Post.find(params[:id])
    unless current_user == @post.user
      flash[:alert] = "Not allow!"
      redirect_to posts_path
    end
  end

end
