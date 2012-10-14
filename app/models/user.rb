class User
  include Mongoid::Document
  field :email, type: String
  field :name, type: String

  has_many :messages
end
