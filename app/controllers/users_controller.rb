class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @users = User.all
  end

  def to_confirm
    @user = User.find_by(id: params[:id])
    @user.to_confirm
    redirect_to users_path
  end

  def to_unconfirmed
    @user = User.find_by(id: params[:id])
    @user.to_unconfirmed
    redirect_to users_path
  end

  def to_admin
    @user = User.find_by(id: params[:id])
    @user.to_admin
    redirect_to users_path
  end

  def to_user
    @user = User.find_by(id: params[:id])
    @user.to_user
    redirect_to users_path
  end
end
