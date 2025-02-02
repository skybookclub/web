class AddFkReviewsToBooks < ActiveRecord::Migration[8.0]
  def up
    execute """
      alter table reviews
        add constraint fk_reviews_to_books foreign key (isbn10, isbn13) references books(isbn10, isbn13)
    """
  end

  def down
    execute 'alter table reviews drop foreign key fk_reviews_to_books'
  end
end
