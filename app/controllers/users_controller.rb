class UsersController < ApplicationController
  layout false

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
