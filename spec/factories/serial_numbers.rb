FactoryGirl.define do
  factory :serial_number do
    name { SecureRandom.hex(2) }
  end

  factory :active_serial_number, class: SerialNumber do
    user

    name { 'af34' }
  end
end
