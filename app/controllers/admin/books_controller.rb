class Admin::BooksController < ApplicationController
  layout :dynamic_layout

  before_action :get_books, except: [:index, :new, :create]
  
  class Constant 
    Page = 10
  end

  def new
    @book = Book.new
    # book.publisher.new
    # book.author.new
  end
  
  def index
    @books = Book.includes(:author).search(params)
      .order_name
      .paginate(page: params[:page], per_page: Constant::Page)
      respond_to do |format|
        format.html
        format.xls { send_data @books.to_xls(col_sep: "\t"), filename: 'export_book' + Time.now.to_s + '.xls'} 
      end
  end

  def destroy
    if @book&.destroy
      flash[:success] = "Delete successfully"
    end
    redirect_to admin_books_path
  end

  def show
  end

  def update
    if @book.update(book_params)
      
      flash[:success] = "Book updated"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      flash[:success] = "Book update successfully"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  private

    def book_params
      params.require(:book).permit :name, :amount, :price, :status, :author_id, :publisher_id
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
