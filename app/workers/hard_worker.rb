# frozen_string_literal: true

class HardWorker
  include Sidekiq::Worker

  def perform(rent)
    byebug
    RentMailer.new_rent_notification(rent).deliver
  end
end
