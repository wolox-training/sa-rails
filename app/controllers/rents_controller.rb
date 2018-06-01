# frozen_string_literal: true

class RentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Rent.all.page(params[:page])
  end

  def create
    rent = Rent.new(rent_params)
    if rent.save
      HardWorker.perform_async(rent.user)
      render json: rent
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :from, :to)
  end
end
