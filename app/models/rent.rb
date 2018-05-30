# frozen_string_literal: true

class Rent < ApplicationRecord
  validate :valid_date
  validates :user, :book, :from, :to, presence: true
  belongs_to :user
  belongs_to :book

  def valid_date
    errors.add(:to, 'Rent end date must be after starting date') if from > to
  end
end
