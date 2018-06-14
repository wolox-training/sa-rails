# frozen_string_literal: true

class BookSuggestionsController < ApplicationController
  respond_to :html, :json

  def new
    @book_suggestion = BookSuggestions.new
  end

  def create
    @book_suggestions = BookSuggestions.new(book_suggestions_params)
    respond_to do |format|
      if @book_suggestions.save
        format.html {  }
        format.json { render json: @book_suggestions, status: :created }
      else
        format.html {  }
        format.json { render json: { errors: @book_suggestions.errors.messages }, status: :bad_request }
      end
    end
  end

  private

  def book_suggestions_params
    params.require(:book_suggestions).permit(
      :editorial, :price, :author, :title, :link, :publisher, :year, :user_id
    )
  end
end
