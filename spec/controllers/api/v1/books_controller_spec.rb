# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 20) }

      before do
        get :index
      end

      it 'responses with the books json' do
        expected = ActiveModelSerializers::SerializableResource.new(
          books
        ).to_json
        expect(response_body.to_json).to eq(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create(:book) }
      let!(:rents) { create_list(:rent, 3, user_id: user.id, book_id: book.id) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book json' do
        expect(response_body.to_json).to eq ActiveModelSerializers::SerializableResource.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
