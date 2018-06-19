# frozen_string_literal: true

class BookSuggestionsByGenre
  include Interactor

  def call
    genre = Book.find(context.book_id).genre
    books_by_genre = Book.filter(genre: genre).to_a
    context.books = filter_leased_books(books_by_genre, context.user, genre)
  end

  def filter_leased_books(all_books, user, genre)
    if user.rents.present?
      user.rents.each do |r|
        all_books.delete(r.book) if r.book.genre == genre
      end
    end
    all_books
  end
end
