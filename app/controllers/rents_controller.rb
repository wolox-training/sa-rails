# frozen_string_literal: true

class RentsController < ApiController
  def index
    render json: Rent.filter(params.slice(current_user, :book)).page(params[:page])
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
    params[:rent][:user_id] = current_user.id
    params.require(:rent).permit(:book_id, :from, :to, :user_id)
  end
end
