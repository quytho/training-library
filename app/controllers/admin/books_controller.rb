class Admin::BooksController < ApplicationController
  layout :dynamic_layout

  before_action :get_books, except: [:index, :new, :create]
  
  def index
    @books = Book.includes(:author).search(params)
      .paginate(page: params[:page], per_page: 10)
  end

  def destroy
    if @book&.destroy
      flash[:success] = "Delete successfully"
    end
    redirect_to admin_books_path
  end

  def show
  end

  def create
    @book = Book.new(user_params)
    if @book.save
      flash[:success] = "Book update successfully"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:book).permit(:name)
    end
    
    def get_books
      @book = Book.find_by_id(params[:id])
      return if @book
      flash[:warning] = "That book could not be found"
      redirect_to admin_books_path  
    end

    def dynamic_layout
      if true # replace for if current_user.admin?
        "admin"
      else
        "users"
      end
    end
end