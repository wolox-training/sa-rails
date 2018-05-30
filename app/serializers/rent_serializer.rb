# frozen_string_literal: true

class RentSerializer < ActiveModel::Serializer
  attributes :from, :to
  belongs_to :user
  belongs_to :book
end
