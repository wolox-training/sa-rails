# frozen_string_literal: true

class Rent < ApplicationRecord
  validate :valid_date
  validates :user, :book, :from, :to, presence: true
  belongs_to :user
  belongs_to :book

  def valid_date
    errors.add(:to, "can't be before from") if from > to
  end
end
