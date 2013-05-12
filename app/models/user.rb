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

  def self.create_with_omniauth(auth)
    logger.info auth.to_yaml

    create! do |user|
      logger.info '---'
      logger.info auth['provider']
      logger.info auth['uid']
      logger.info auth['info']['nickname']
      logger.info '---'

      user.provider = auth['provider']
      user.uid = auth['uid']
      user.login = auth['info']['nickname']
    end
  end
end
