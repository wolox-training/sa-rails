# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    user { create(:user) }
    book { book_id }
    from { Faker::Date.forward(1) }
    to { from.next_day }
  end
end
