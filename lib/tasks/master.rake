namespace :master do
  desc 'Create a user with a new serial number, EMAIL, and password. And then generate a game with NAME'
  task all: :environment do
    begin
      ActiveRecord::Base.transaction do
        # Generate a serial number
        ENV['COUNT'] = '1'
        Rake::Task['serial_numbers:populate'].execute

        # Create user
        ENV['SERIAL_NUMBER'] = SerialNumber.inactive.last.name
        Rake::Task['users:activate'].execute
        user = User.last

        # Create five commands
        Rake::Task['commands:populate'].execute

        # Create a game
        ENV['USER_ID'] = user.id.to_s
        Rake::Task['game:create'].execute
      end
    rescue => e
      puts "Error:\n#{e.message}\n#{e.backtrace}"
    end
  end
end
