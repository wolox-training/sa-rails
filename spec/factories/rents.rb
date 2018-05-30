# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    user_id { create(:user).id }
    book_id { create(:book).id }
    from { Faker::Date.forward(1) }
    to { from.next_day }
  end
end
