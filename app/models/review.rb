class Review < ApplicationRecord
  belongs_to :book, foreign_key: ['isbn10', 'isbn13'], primary_key: ['isbn10', 'isbn13']
end
