class Message
  include Mongoid::Document
  field :scope, type: String
  field :char, type: String
  field :name, type: String
  field :body, type: String
  field :classes, type: Array

  # scopes: dm, ooc, dice, npc

  belongs_to :user
end
