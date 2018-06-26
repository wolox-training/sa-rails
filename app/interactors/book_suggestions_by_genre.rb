# frozen_string_literal: true

class BookSuggestionsByGenre
  include Interactor

  def call
    context.fail!(message: 'Book no has genre') unless book.genre
    context.books = Book.where(genre: book.genre).where.not(id: book_ids)
  end

  private

  def book_ids
    user.rents.pluck(:book_id).uniq
  end

  def user
    @user ||= context.user
  end

  def book
    context.fail!(message: 'Book id is null') unless context.book_id
    @book ||= Book.find(context.book_id)
  end
end
