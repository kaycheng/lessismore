class ApplicationController < ActionController::Base

  private
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to posts_path
    end
  end
end
