class AuthorsController < ApplicationController
  class Constant
    PAGINATE = 5
  end
  
  def index
    @authors = Author.paginate(page: params[:page], per_page: Constant::PAGINATE)
  end
end
