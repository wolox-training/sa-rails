# frozen_string_literal: true

class Rent < ApplicationRecord
  validates :user, :book, :from, :to, presence: true
  validates_date :to, after: :from, after_message: 'must be after the "from" date'
  belongs_to :user
  belongs_to :book
end
