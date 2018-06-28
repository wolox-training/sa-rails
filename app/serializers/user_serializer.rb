# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :locale, :tokens
  has_many :rents
end
