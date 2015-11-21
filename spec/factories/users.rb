FactoryGirl.define do
  factory :user, class: User do
  end

  factory :dan, class: User do
    email 'dan@gmail.com'
    password 'foo'
  end
end
