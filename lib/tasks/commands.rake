namespace :commands do
  desc 'Generate five predefined commands'
  task populate: :environment do
    ActiveRecord::Base.transaction do
      ['Move Forward', 'Move Backward', 'Turn Left', 'Turn Right',
       'Avoid Obstacles'].each_with_index do |name, index|

        unless Command.exists?(name: name)
          Command.create!(name: name, data: index)
        end
      end
    end
  end
end
