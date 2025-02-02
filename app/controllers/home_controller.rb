class HomeController < ApplicationController
  def index
  end

  def search
    @query = params[:query]
    if @query.blank?
      redirect_to root_path
    end
    @query = @query.strip.downcase
    @books = Book.where(["lower(title) LIKE ? or isbn10 = ? or isbn13 = ?", "%#{@query}%", @query, @query]).limit(10)
  end
end
