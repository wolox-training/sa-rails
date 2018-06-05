# frozen_string_literal: true

class RentsController < ApiController
  def index
    render json: Rent.where(user: params[:user_id]).or(
      Rent.where(book: params[:book_id])
    ).page(params[:page])
  end

  def create
    rent = Rent.new(rent_params)
    if rent.save
      render json: rent, status: :created
    else
      render json: rent.errors.messages, status: :bad_request
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end
end
