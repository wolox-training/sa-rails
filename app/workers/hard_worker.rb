# frozen_string_literal: true

class HardWorker
  include Sidekiq::Worker

  def perform(user)
    puts "HardWorker"
    RentMailer.new_rent_notification(user).deliver
  end
end
