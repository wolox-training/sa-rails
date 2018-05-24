# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
end
