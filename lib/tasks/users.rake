namespace :users do
  desc 'create a user with EMAIL and PASSWORD and associate it to SERIAL_NUMBER'
  task activate: :environment do
    sn = SerialNumber.inactive.where(name: serial_number).first

    attributes = {
      password: ENV['PASSWORD'],
      email: ENV['EMAIL']
    }

    User.activate!(sn, attributes)
  end

  def serial_number
    ENV['SERIAL_NUMBER']
  end
end
