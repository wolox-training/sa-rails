# frozen_string_literal: true

class BookSuggestionsByGenre
  include Interactor

  def call
    context.fail!(message: 'Book id is null') if context.book_id.nil?
    context.books = Book.where(genre: genre).where.not(id: book_ids)
  end

  private

  def book_ids
    user.rents.pluck(:book_id).uniq
  end

  def genre
    genre = Book.find(book_id).genre
    context.fail!(message: 'Book unless genre') if genre.nil?
    genre
  end

  def user
    @user ||= context.user
  end

  def book_id
    @book_id ||= context.book_id
  end
end
