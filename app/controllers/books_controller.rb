class BooksController < ApplicationController
  def show
    isbn = params.extract_value(:isbn)
    logger.info(isbn)
    @book = Book.find(isbn)
    if @book.nil?
      redirect_to root_path, alert: "Book not found"
    end
  end
end
