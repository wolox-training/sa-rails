# frozen_string_literal: true

class Book < ApplicationRecord
  paginates_per 50
  validates :genre, :author, :image, :title, :publisher, :year, presence: true

  has_many :rents, dependent: :destroy
end
