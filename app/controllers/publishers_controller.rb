class PublishersController < ApplicationController
  def index
    @publishers = Publisher.paginate(page: params[:page], per_page: 10)
  end
end
