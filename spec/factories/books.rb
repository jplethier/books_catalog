# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "F_TITLE"
    sequence(:isbn) { |n| "#{n}_ISBN" }
  end
end
