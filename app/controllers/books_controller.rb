class BooksController < ApplicationController
  def index
    @books = if params[:term]
      Book.where('name LIKE ?', "%#{params[:term]}%")
    else
      Book.all
    end
  end
  private
    def book_params
      params.permit(:term)
    end
end
