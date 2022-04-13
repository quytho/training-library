class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find(params[:id])
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(categories_params)

    if @categories.save
      redirect_to index_category_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
    @categories = Category.find(params[:id])

    if @categories.update(categories_params)
      redirect_to @categories
    else
      render :edit
    end
  end

  def destroy
    @categories = Category.find(params[:id])
    @categories.destroy
    redirect_to index_category_path
  end

  private
    def categories_params
      params.require(:categories).permit(:name)
    end
end
