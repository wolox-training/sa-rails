# frozen_string_literal: true

class MailWorker
  include Sidekiq::Worker

  def perform(rent_id)
    RentMailer.new_rent_notification(Rent.find(rent_id)).deliver
  end
end
