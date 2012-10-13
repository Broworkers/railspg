namespace :messages do
  desc 'Flood messages'
  task run: :environment do
    class QuitException < Exception; end

    INTERVAL = Integer(ENV['INTERVAL'] || 5)

    trap 'INT' do
      raise QuitException
    end

    puts "Creating messages with #{INTERVAL} seconds interval"

    begin
      loop do
        Message.create(scope: 'scope', char: 'Jonhy Fucker',
                       name: 'jonhy@fucker.com', body: 'Bodi',
                       classes: %w[ message ], created_at: Time.now)

        print '.'
        sleep INTERVAL
      end
    rescue QuitException
      puts
    end
  end

  desc 'Remove all messages'
  task clean: :environment do
    Message.destroy_all
  end
end
