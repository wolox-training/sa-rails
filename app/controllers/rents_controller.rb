# frozen_string_literal: true

class RentsController < ApiController
  def index
    render json: Rent.filter(params.slice(current_user, :book)).page(params[:page])
  end

  def create
    rent = Rent.new(rent_params)
    rent.user = current_user
    if rent.save
      MailWorker.perform_async(rent.id)
      render json: rent, status: :created
    else
      render json: { errors: rent.errors.messages }, status: :bad_request
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:book_id, :from, :to)
  end
end
