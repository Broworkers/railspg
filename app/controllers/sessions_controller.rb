class SessionsController < ApplicationController
  def create
    @user = warden.authenticate

    if @user
      # redirect_to someplace_path
      render text: 'Now you are logged'
    else
      flash.now.alert = warden.message if warden.message.present?
      render :new
    end
  end

  def destroy
    logout
    redirect_to :login
  end
end
