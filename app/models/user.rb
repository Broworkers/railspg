class User
  include Mongoid::Document
  field :email, type: String
  field :name, type: String
  field :dm, type: Boolean
  field :host, type: Boolean

  has_many :messages
end
