# frozen_string_literal: true

class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :publisher, :year, presence: true

  has_many :rents, dependent: :destroy
  has_many :books_suggestions, dependent: :destroy

end
