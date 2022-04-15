class PublishersController < ApplicationController
  before_action :get_publishers, except: [:index, :new, :create]
  def index
    @publishers = Publisher.search(params)
      .paginate(page: params[:page], per_page: 10)
  end
  def new
    @publisher = Publisher.new
  end
  def create
    @publisher = Publisher.new(user_params)
    if @publisher.save
      flash[:success] = "Publisher successfully"
      redirect_to publishers_path and return
    else
      render :new
    end
  end
  def show
  end
  def update
    if @publisher.update(user_params)
        flash[:success] = "Publisher updated"
        redirect_to publishers_path and return
        render 'new'
    end
  end
  def destroy
    @publisher.destroy
    flash[:success] = "Publisher deleted"
    redirect_to publishers_path
end
  private
    def user_params
      params.require(:publisher).permit(:name)
    end
    def get_publishers
      @publisher = Publisher.find_by(id: params[:id])
    end
end
