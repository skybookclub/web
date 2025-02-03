class Book < ApplicationRecord
  has_many :reviews, foreign_key: [ "isbn10", "isbn13" ], primary_key: [ "isbn10", "isbn13" ]

  def update_ratings
    query = """
      select avg(rating) as avg, count(rating) as cnt from (select distinct on (did) rating from reviews where isbn13 = $1 order by did asc, created_at desc) v
    """
    new_rating = ActiveRecord::Base.connection.select_one(query, "SQL", [ isbn13 ])
    logger.info(new_rating)
    self.update(rating: new_rating["avg"], rating_count: new_rating["cnt"])
  end
end
