class PublishersController < ApplicationController
  before_action :get_publishers, except: [:index, :new, :create]
  def index
    @publishers = Publisher.paginate(page: params[:page], per_page: 10)
  end
  def new
    @publisher = Publisher.new
  end
  def create
    @publisher = Publisher.create(user_params)
    if @category.save
    
    else
      render :new
    end
  end
  def show
  end
  def update
    if @publisher.update(user_params)
        flash[:success] = "Post updated"
        redirect_to @publisher and return
        render 'new'
    end
end
  private
    def user_params
      params.require(:publisher).permit(:name)
    end
    def get_publishers
      @publisher = Publisher.find(params[:id])
    end
end
