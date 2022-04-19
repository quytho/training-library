class Admin::AuthorsController < ApplicationController
  before_action :get_authors, except: [:index, :new, :create]

  def index
    @authors = Author.search(params)
      .order_name
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(user_params)
    if @author.save
      flash[:success] = "Author successfully"
      redirect_to admin_authors_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @author.update(user_params)
      flash[:success] = "Author updated"
      redirect_to admin_authors_path
    else
      render :new
    end
  end

  def destroy
    @author.destroy
    flash[:success] = "Author deleted"
    redirect_to admin_authors_path
  end
  
  private
    def user_params
      params.require(:author).permit(:name)
    end

    def get_authors
      @author = Author.find_by_id(params[:id])
      return if @author
      flash[:warning] = "That author could not be found"
      redirect_to admin_authors_path 
    end
end
