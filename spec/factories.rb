FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "password"
    password_confirmation "password"

  end

  factory :task do
    subject "Subject lorem ipsum"
    body "Body lorem ipsum"
    user
  end
end