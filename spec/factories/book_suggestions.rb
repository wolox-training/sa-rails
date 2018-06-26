# frozen_string_literal: true

FactoryBot.define do
  factory :book_suggestions do
    editorial { Faker::Book.publisher }
    price { Faker::Commerce.price }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1, 2018) }
    user { create(:user) }
  end
end
