def create_random_message
  user = User.where(email: 'foobar@example.com').first
  scope = %w[ dm ooc dice npc ].sample
  name = %w[ Conan Batman Robin Curinga ].sample
  classes = %w[ system dice tell npc dm me whisper say ooc ].sample
  body = [
    'I hate globlins',
    'Now you are dead',
    'I found some money',
    'Do you want pizza?',
    'I do like GURPS'
  ].sample

  Message.create(user: user, scope: scope, name: name, body: body,
                 classes: classes, created_at: Time.now)
end

namespace :messages do
  desc 'Flood messages'
  task run: :environment do
    class QuitException < Exception; end
    INTERVAL = Integer(ENV['INTERVAL'] || 5)

    trap 'INT' do
      raise QuitException
    end

    begin
      puts "Creating messages with #{INTERVAL} seconds interval"
      loop do
        create_random_message
        print '.'
        sleep INTERVAL
      end
    rescue QuitException
      puts
    end
  end

  desc 'Remove all messages'
  task clear: :environment do
    Message.destroy_all
  end
end
