# frozen_string_literal: true

require 'rails_helper'

describe BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a valid book_suggestion' do
      let!(:book_suggestion) { create(:book_suggestion) }

      it 'creates a new book suggestion' do
        expect do
          post :create, params: { book_suggestion: book_suggestion.attributes }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: book_suggestion.attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid book_suggestion' do
      let!(:book_suggestion) do
        bs = FactoryBot.build(:book_suggestion, author: '')
        bs.save(validate: false)
        bs
      end

      before do
        post :create, params: { book_suggestion: book_suggestion.attributes }
      end

      it 'doesn\'t create a new rent' do
        expect do
          post :create, params: { book_suggestion: book_suggestion.attributes }
        end.to change { BookSuggestion.count }.by(0)
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
