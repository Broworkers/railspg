class UsersController < ApplicationController
  layout false

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    current_user.update_attributes params[:user]
    head status: 200
  end
end
