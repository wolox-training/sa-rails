# frozen_string_literal: true

class ApiController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_locale
#
#   # def set_locale
#   #   I18n.locale = current_user.try(:locale) || I18n.default_locale
  # end
end
