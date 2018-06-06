# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    locale { 'en' }
  end
end
