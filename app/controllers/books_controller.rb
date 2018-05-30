# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Book.all.page(params[:page])
  end

  def show
    render json: Book.find(params[:id])
  end
end
