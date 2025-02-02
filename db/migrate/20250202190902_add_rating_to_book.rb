class AddRatingToBook < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :rating, :float, null: false, default: 0.0
  end
end
