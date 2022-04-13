class BooksController < ApplicationController
  def index
    @books = Book.search(params)
  end
end
