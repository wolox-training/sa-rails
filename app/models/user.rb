# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  attr_accessor :login
  validates :first_name, presence: true
  validates :last_name, presence: true
end
