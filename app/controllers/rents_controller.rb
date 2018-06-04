# frozen_string_literal: true

class RentsController < ApiController
  def index
    render json: Rent.all.page(params[:page])
  end

  def create
    rent = Rent.new(rent_params)
    if rent.save
      render json: rent
    else
      render json: { errors: rent.errors.messages }
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end
end
