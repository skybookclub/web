class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books, primary_key: ['isbn10', 'isbn13'] do |t|
      t.string :isbn10, null: false
      t.string :isbn13, null: false
      t.string :title
      t.string :author
      t.string :cover_image_url

      t.timestamps
    end
  end
end
