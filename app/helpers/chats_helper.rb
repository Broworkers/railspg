module ChatsHelper
  def classes_for(another)
    [].tap do |classes|
      classes << 'dm' if another.dm?
      classes << 'host' if another.host?
      classes << 'me' if current_user == another
    end
  end
end
