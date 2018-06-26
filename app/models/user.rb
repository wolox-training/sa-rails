# frozen_string_literal: true

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  validates :first_name, :last_name, presence: true
  validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }, presence: true

  has_many :rents, dependent: :destroy
  has_many :books_suggestions, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable

  # This method is added to avoid the confirmation of 'devise' while the final solution is found
  protected

  def confirmation_required?
    false
  end
end
