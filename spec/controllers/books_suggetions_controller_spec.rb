# frozen_string_literal: true

require 'rails_helper'

describe BooksSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a valid book_suggestions' do
      let!(:book_suggestion) { create(:book_suggestions) }

      it 'creates a new book suggestion' do
        expect do
          post :create, params: { book_suggestions: book_suggestion.attributes }
        end.to change { BookSuggestions.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestions: book_suggestion.attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid book_suggestions' do
      let!(:book_suggestion) { create(:book_suggestions, user: nil) }

      before do
        post :create, params: { book_suggestions: book_suggestion.attributes }
      end

      it 'doesn\'t create a book_suggestions' do
        expect do
          post :create, params: { book_suggestions: book_suggestion.attributes }
        end.to change { BookSuggestions.count }.by(0)
      end

      it 'returns errors messages' do
        expect(response_body['errors']).to be_present
      end

      it 'responds with 400 status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
