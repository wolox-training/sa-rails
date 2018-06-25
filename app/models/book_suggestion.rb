# frozen_string_literal: true

class BookSuggestion < ApplicationRecord
  validates :author, :link, :title, presence: true

  belongs_to :user, optional: true
end
