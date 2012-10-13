class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :warden

  private
  def authenticate! user
    warden.set_user(user)
  end

  def current_user
    warden.user
  end

  def warden
    env['warden']
  end

  def logout
    warden.logout
  end
end
