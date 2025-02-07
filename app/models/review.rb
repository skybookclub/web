class Review < ApplicationRecord
  belongs_to :book, foreign_key: [ "isbn10", "isbn13" ], primary_key: [ "isbn10", "isbn13" ]
  belongs_to :profile, foreign_key: :did, primary_key: :did
end
