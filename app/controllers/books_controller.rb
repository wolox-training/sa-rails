# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    books = Book.all.page(1)
    render json: books
  end

  def show
    book = Book.find(params[:id])
    render json: book
  end
end
