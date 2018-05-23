# frozen_string_literal: true

class Book < ApplicationRecord
  validates :genre, :author, :image, :tittle, :publisher, :year, presence: true
end
