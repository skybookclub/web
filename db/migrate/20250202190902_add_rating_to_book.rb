class AddRatingToBook < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :rating, :float, null: true, default: nil
    add_column :books, :rating_count, :bigint, null: true, default: nil
  end
end
