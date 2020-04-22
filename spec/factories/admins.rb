FactoryBot.define do
  factory :admins do
    email { Faker::Internet.email }
    password { 'password' }
  end
end