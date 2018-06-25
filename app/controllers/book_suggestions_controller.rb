# frozen_string_literal: true

class BookSuggestionsController < ApiController
  skip_before_action :authenticate_user!, only: [:create]
  skip_before_action :verify_user, only: [:create]

  def create
    book_suggestion = BookSuggestion.new(book_suggestion_params)

    if book_suggestion.save
      render json: book_suggestion, status: :created
    else
      render json: { errors: book_suggestion.errors.messages }, status: :bad_request
    end
  end

  private

  def book_suggestion_params
    params.require(:book_suggestion).permit(
      :editorial, :price, :author, :title, :link, :publisher, :year, :user_id
    )
  end
end
