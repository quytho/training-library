class PublishersController < ApplicationController
  def index
    @publishers = Publisher.paginate(page: params[:page], per_page: 10)
  end
  def new
    @publisher = Publisher.new
  end
  private
    def user_params
      params.require(:publisher).permit(:name)
    end
end
