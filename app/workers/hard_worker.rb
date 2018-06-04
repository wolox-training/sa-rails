# frozen_string_literal: true

class HardWorker
  include Sidekiq::Worker

  def perform_mail(rent)
    RentMailer.new_rent_notification(rent).deliver
  end
end
