namespace :game do
  desc 'create a game FOR USER_ID with NAME with ten random instructions'
  task create: :environment do
    ActiveRecord::Base.transaction do
      commands = Command.all.to_a

      ActiveRecord::Base.transaction do
        Game.create!(user_id: ENV['USER_ID'], name: ENV['NAME']).tap do |game|
          10.times.each do |index|
            game.instructions.create!(command: commands[Random.rand(5)], precedence: index)
          end
        end
      end
    end
  end
end
