Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :password
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find(id)
end

Warden::Strategies.add(:password) do
  def valid?
    params['email']
  end

  def authenticate!
    user = User.where( email: params['email'] ).first

    if user
      success! user
    else
      fail "Invalid email or password"
    end
  end
end
