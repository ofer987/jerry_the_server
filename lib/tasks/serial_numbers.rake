namespace :serial_numbers do
  desc "Create COUNT amount of users (default = 10)"
  task populate: :environment do
    ActiveRecord::Base.transaction do
      count.times.map do
        SerialNumber.create!(name: SecureRandom.hex(2))
      end
    end
  end

  private

  def count
    ENV['COUNT'].to_i || 10
  end
end
