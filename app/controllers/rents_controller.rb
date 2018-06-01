# frozen_string_literal: true

class RentsController < ApiController

  def index
    render json: Rent.all.page(params[:page])
  end

  def create
    rent = Rent.new(rent_params)
    if rent.save
      render json: rent
    elsif rent.book_id == nil or rent.user_id == nil or rent.to == nil or rent.from == nil
      render json: {status: "error", code: 400, message: "Can't save a rent because one or more parameters of the request are null"}
    else
      render json: {status: "error", code: 500, message: "Can't save a rent"}
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end
end
