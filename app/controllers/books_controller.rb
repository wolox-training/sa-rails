# frozen_string_literal: true

class BooksController < ApiController
  def index
    render json: Book.all.page(params[:page])
  end

  def show
    render json: Book.find(params[:id])
  end

  def suggestions
    result = BookSuggestionsByGenre.call(book_id: params[:book_id], user: current_user)
    if result.success?
      render json: result.books
    else
      render json: { errors: result.messages }
    end
  end
end
