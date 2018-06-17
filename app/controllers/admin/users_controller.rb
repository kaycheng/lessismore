class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_user, only: [:show, :edit, :update]

  def update
    @user.update(user_params)
    redirect_to admin_user_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :photo, :slogan)
  end
end
