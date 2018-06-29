# frozen_string_literal: true

class RentMailer < ApplicationMailer
  def new_rent_notification(rent)
    @rent = rent
    I18n.locale = @rent.user.locale
    mail to: @rent.user.email, subject: t(:rent_notification)
  end
end
