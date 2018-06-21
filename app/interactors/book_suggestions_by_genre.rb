# frozen_string_literal: true

class BookSuggestionsByGenre
  include Interactor

  def call
    context.books = Book.where(genre:
      get_genre(context.book_id)).where.not(id: get_book_ids(context.user))
  rescue StandardError => e
    context.fail!(message: e)
  end

  def get_book_ids(user)
    user.rents.pluck(:book_id).uniq
  end

  def get_genre(book_id)
    genre = Book.find(book_id).genre
    context.fail!(message: 'Book has no gender') if genre.nil?
    genre
  end
end
