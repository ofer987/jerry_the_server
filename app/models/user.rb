class User < ActiveRecord::Base
  # id, integer, PKEY, NOT NULL
  # serial_number, string, unique index, NOT NULL
  # email, string, NULL
  # active, boolean, NOT NULL

  has_one :serial_number

  validates :email, presence: true, email: true

  has_secure_password

  def self.activate!(serial_number, attributes)
    transaction do
      if serial_number
        user = User.create!(attributes)

        serial_number.update!(user_id: user.to_param)

        user
      end
    end
  end
end
