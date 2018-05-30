# frozen_string_literal: true

class RentsController < ApplicationController
	protect_from_forgery with: :null_session
  # before_action :authenticate_user!

  def index
    rents = Rent.all.page(1)
    render json: rents
  end

  def create
    rent = Rent.new(params[:rents])
    # rent.save
    render json: rent
  end
end
