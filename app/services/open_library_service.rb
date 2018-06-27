# frozen_string_literal: true

require 'httparty'

class OpenLibraryService
  include HTTParty

  base_uri 'https://openlibrary.org/api'

  def book_info(isbn)
    response = self.class.get("/books?jscmd=data&format=json&bibkeys=#{isbn}", isbn: isbn)
    return nil unless response.key?(isbn)
    build_book_info(response, isbn)
  end

  protected

  def build_book_info(api_response, isbn)
    book_info = api_response[isbn].slice('title', 'subtitle', 'number_of_pages')
    book_info['authors'] = api_response[isbn]['authors'].map { |a| a['name'] }
    Hash[isbn => book_info]
  end
end
