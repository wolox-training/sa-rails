# frozen_string_literal: true

class RentsController < ApiController
  def index
    render json: Rent.all.page(params[:page])
  end

  def create
    rent = Rent.new(rent_params)
    if rent.save
      #HardWorker.perform_async(rent)
      RentMailer.new_rent_notification(rent).deliver
      render json: rent
    elsif rent.book_id.nil? || rent.user_id.nil? || rent.to.nil? || rent.from.nil?
      render json: { status: 'error',
                     code: 400,
                     message: "Can't save a rent, one or more parameters of the request are null" }
    else
      render json: { status: 'error', code: 500, message: "Can't save a rent" }
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end
end
