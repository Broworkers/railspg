class SessionsController < ApplicationController

  layout 'public'

  def create
    @user = warden.authenticate

    if @user
      redirect_to :chat
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
