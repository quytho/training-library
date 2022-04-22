class Admin::BooksController < ApplicationController
  layout :dynamic_layout

  before_action :get_books, except: [:index, :new, :create]

  def new
    @book = Book.new
    @book.build_publisher
    @book.build_author
  end
  
  def index
    @books = Book.includes(:author).search(params)
      .order_name
      .paginate(page: params[:page], per_page: 10)
      respond_to do |format|
        format.html
        format.xls { send_data @books.to_xls(col_sep: "\t") } 
      end
  end

  def destroy
    if @book&.destroy
      flash[:success] = "Delete successfully"
    else
      flash[:warning] = "Book delete failed"
    end
    redirect_to admin_books_path
  end

  def show
  end

  def update
    if @book.update(book_params)
      flash[:success] = "Book updated"
    else
      flash[:warning] = "Book updatedd failed"
    end
    redirect_to admin_books_path
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book create successfully"
    else
      flash[:warning] = "Book create failed"
    end
    redirect_to admin_books_path
  end

  private

    def book_params
      params.require(:book).permit(:name, :amount, :price, :status, :author_id, :publisher_id,
        publisher_attributes:[:name], author_attributes:[:name])
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
