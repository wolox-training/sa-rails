class BookSuggestionsByGenre
  include Interactor

  def call
    begin
      genre = Book.find(context.book_id).genre
      books_by_genre = Book.filter(genre: genre).to_a
      if context.user.rents.present?
        context.user.rents.each do |r|
          books_by_genre.delete(r.book) if r.book.genre == genre
        end
      end
      context.books = books_by_genre
    rescue => e
      context.fail!(message: e)
    end
  end
end
