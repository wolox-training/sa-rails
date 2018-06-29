# frozen_string_literal: true

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  validates :first_name, :last_name, presence: true
  validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }, presence: true

  has_many :rents, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable

  protected

  # Alternative Solution. Issue: https://github.com/lynndylanhurley/devise_token_auth/issues/1079
  def confirmation_required?
    false
  end
end
