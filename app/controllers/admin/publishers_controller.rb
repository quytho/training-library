class Admin::PublishersController < ApplicationController
  layout :dynamic_layout
  before_action :get_publishers, except: [:index, :new, :create]
  class Constant 
    Page = 10
  end
  def index
    @publishers = Publisher.search(params)
      .order_name
      .paginate(page: params[:page], per_page: Constant::Page)
      respond_to do |format|
        format.html
        format.xls { send_data @publishers.to_xls(col_sep: "\t"), filename: 'export_publisher' + Time.now.to_s + '.xls'} 
      end
    end 

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(user_params)
    if @publisher.save
      flash[:success] = "Publisher successfully"
      redirect_to admin_publishers_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @publisher.update(user_params)
      flash[:success] = "Publisher updated"
      redirect_to admin_publishers_path
    else
      render :new
    end
  end

  def destroy
    if (Book.where(publisher_id: params[:id])).empty?
      @publisher&.destroy
      flash[:success] = "Delete successfully"
    else
      flash[:warning] = "Delete failed"
    end
    redirect_to admin_publishers_path
  end

  private
    def user_params
      params.require(:publisher).permit(:name)
    end
    
    def get_publishers
      @publisher = Publisher.find_by_id(params[:id])
      return if @publisher
      flash[:warning] = "That publisher could not be found"
      redirect_to admin_publishers_path  
    end

    def dynamic_layout
      if true # replace for if current_user.admin?
        "admin"
      else
        "users"
      end
    end
end
