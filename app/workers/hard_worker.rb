# frozen_string_literal: true

class HardWorker
  include Sidekiq::Worker

  def perform(rent_id)
    RentMailer.new_rent_notification(rent_id).deliver
  end
end
