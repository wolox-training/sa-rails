# frozen_string_literal: true

class BooksController < ApiController
  skip_before_action :authenticate_user!, only: [:book_info]
  skip_before_action :verify_user, only: [:book_info]

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

  def book_info
    isbn_info = OpenLibraryService.new.book_info(params['isbn'])
    render json: { errors: '' }, status: :bad_request unless isbn_info
    render json: isbn_info
  end
end
