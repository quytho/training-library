class BooksController < ApplicationController
  def index
    @books = Book.search(params).paginate(page: 1, per_page: 11)
  end
end
