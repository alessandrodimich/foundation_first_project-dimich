FactoryGirl.define do

  factory :user do
    first_name     "Alessandro"
    last_name "Dimich"
    email    "dimichsubs@example.com"
    user_name "dimich71"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :event do
    name "Test Event"
    user
  end

end

