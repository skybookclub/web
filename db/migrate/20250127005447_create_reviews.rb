class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews, primary_key: ['did', 'isbn10', 'isbn13'] do |t|
      t.string :did, null: false
      t.string :isbn10, null: false
      t.string :isbn13, null: false
      t.integer :rating
      t.string :text

      t.timestamps
    end
  end
end
