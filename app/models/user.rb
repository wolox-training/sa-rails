# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :rents, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User
end
