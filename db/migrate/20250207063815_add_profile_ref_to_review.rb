class AddProfileRefToReview < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :reviews, :profiles, column: :did, primary_key: :did
  end
end
