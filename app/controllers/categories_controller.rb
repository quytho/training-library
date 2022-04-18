class CategoriesController < ApplicationController
  before_action :get_category, except: [:index, :new]
  
  def index
    @category = if params[:name]
      Category.where('name LIKE ?', "%#{params[:name]}%")
    else
    @category = Category.paginate(page: params[ :page], per_page: 3 )
    end
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to categories_path 
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def get_category
      @category = Category.find_by(id: params[:id])
      # redirect_to root_url unless @category
    end
end
