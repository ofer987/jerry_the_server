FactoryGirl.define do
  factory :drive_forward, class: Command do
    name 'Drive Forward'
    data 1
  end

  factory :command do
    name 'Hide'
    data 231
  end
end
