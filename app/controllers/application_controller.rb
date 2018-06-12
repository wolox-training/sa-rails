# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  private

  def user_not_authorized
    render json: { errors: 'You are not authorized for this action.' }, status: :unauthorized
  end
end
