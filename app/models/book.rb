# frozen_string_literal: true

class Book < ApplicationRecord
  include Filterable

  validates :genre, :author, :image, :title, :publisher, :year, presence: true

  has_many :rents, dependent: :destroy
end
