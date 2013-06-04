# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "f_email_#{n}@factory.com" }
    password "F_PASSWORD"
    password_confirmation "F_PASSWORD"
    sequence(:username) { |n| "F_#{n}" }
  end

  factory :admin_user, parent: :user do
    admin true
  end
end
