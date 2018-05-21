# frozen_string_literal: true

class Book < ApplicationRecord
  validates :genre, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :tittle, presence: true
  validates :publisher, presence: true
  validates :year, presence: true
end
