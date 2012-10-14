class SessionsController < ApplicationController
  layout 'public'

  def create
    auth = request.env['omniauth.auth']
    user = begin
             User.find_by(provider: auth['provider'], uid: auth['uid'])
           rescue
             User.create_with_omniauth(auth)
           end

    session[:user_id] = user.id
    redirect_to :chat
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end
end
