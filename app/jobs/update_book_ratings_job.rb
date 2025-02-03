class UpdateBookRatingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    books = Book
      .joins(:reviews)
      .where("books.rating is null or reviews.created_at > books.updated_at")
    logger.info "Updating #{books.count} books"
    books.each(&:update_ratings)
  end
end
