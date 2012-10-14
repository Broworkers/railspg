class Message
  include Mongoid::Document
  field :scope, type: String
  field :name, type: String
  field :body, type: String
  field :classes, type: Array
  field :created_at, type: Time
  field :sent, type: Time
  field :source, type: Time
  field :copy, type: Boolean

  belongs_to :user

  default_scope order_by(created_at: 1)

  after_create :create_others_users_copy

  def create_others_users_copy
    return true if copy?

    User.where(:user_id.ne => user.id).each do |another|
      another.messages.create attributes_for_copy
    end
  end

  def attributes_for_copy(extras={})
    attributes.merge copy: true
  end
end
