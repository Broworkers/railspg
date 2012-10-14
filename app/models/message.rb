class Message
  include Mongoid::Document
  field :scope, type: String
  field :name, type: String
  field :body, type: String
  field :classes, type: Array
  field :created_at, type: Time, default: -> { Time.now }
  field :sent, type: Boolean
  field :source, type: Time

  attr_accessor :plain, :original

  belongs_to :user

  default_scope order_by(created_at: 1)

  attr_accessible *fields.keys + %w[ original plain ]
  attr_accessible *fields.keys - %w[ _id sent ], :as => :copy

  before_save :digest_plain
  after_create :create_others_users_copy

  def digest_plain
    return unless plain
    plain.strip!

    case plain
    when %r[/(say|me) (.*)]i
      self['name'] = user.name
      self['classes'] = [ $1 ]
      self['body'] = $2
    when %r[/(ooc) (.*)]i
      self['name'] = user.email
      self['classes'] = [ $1 ]
      self['scope'] = 'OOC'
      self['body'] = $2
    when %r[/(npc) ([^:]*): *(.*)$]i
      self['classes'] = [ $1 ]
      self['scope'] = 'NPC'
      self['name'] = $2
      self['body'] = $3
    when %r[/(tell) (.*)]i
      self['classes'] = [ $1 ]
      self['body'] = $2
    when %r[/roll (\d+)d *(\d+)?]i
      dices = Dice.roll($1, $2)
      self['classes'] = 'dice'
      self['scope'] = 'Dice'
      self['body'] = "#{user.name} (#{user.email}) rolls #{$1}d#{$2}: #{dices.join(' + ')} = **#{dices.inject {|s,d| s + d }}**"
    else
      self['name'] = user.name
      self['classes'] = [ 'ooc' ]
      self['scope'] = 'OOC'
      self['body'] = plain
    end
  end

  def create_others_users_copy
    return true unless original

    User.where(:id.ne => user.id).each do |another|
      another.messages.create attributes, :as => :copy
    end
  end

  def sent!
    return if sent?
    update_attributes sent: true
  end
end
