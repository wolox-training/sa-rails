# frozen_string_literal: true

class RentsController < ApiController
  def index
    render json: Rent.filter(params.slice(:user, :book)).page(params[:page])
  end

  def create
    rent = Rent.new(rent_params)
    rent.user = current_user
    if rent.save
      render json: rent, status: :created
    else
      render json: rent.errors.messages, status: :bad_request
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:book_id, :from, :to)
  end
end
