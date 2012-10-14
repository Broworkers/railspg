class User
  include Mongoid::Document
  field :uid, type: String
  field :provider, type: String
  field :login, type: String
  field :nick, type: String
  field :sheet, type: String
  field :dm, type: Boolean
  field :host, type: Boolean

  has_many :messages
  has_one :sheet

  def self.create_with_omniauth(auth)
    logger.info auth.to_yaml

    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.login = auth['user_info']['name']
    end
  end
end
