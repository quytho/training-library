class CategoriesController < ApplicationController
  before_action :get_category, except: [:index, :new]
  
  def index
    @category = Category.paginate(page: params[ :page], per_page: 3 )
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to index_category_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to index_category_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def get_category
      @category = Category.find_by(params[:id])
    
      redirect_to root_url unless @category
    end
end
