# frozen_string_literal: true

class UsersController < ApiController
  def create
    rent = Rent.new(rent_params)
    if rent.save
      HardWorker.perform_async(rent.id)
      render json: rent, status: :created
    else
      render json: { errors: rent.errors.messages }, status: :bad_request
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end
end
