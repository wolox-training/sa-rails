# frozen_string_literal: true

class BooksSuggestionsController < ApplicationController
  def create
    book_suggestions = BookSuggestions.new(book_suggestions_params)
    if book_suggestions.save
      render json: book_suggestions, status: :created
    else
      render json: { errors: book_suggestions.errors.messages }, status: :bad_request
    end
  end

  private

  def book_suggestions_params
    params.require(:book_suggestions).permit(
      :editorial, :price, :author, :title, :link, :publisher, :year, :user_id
    )
  end
end
