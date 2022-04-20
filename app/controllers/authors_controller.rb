class AuthorsController < ApplicationController
  class Constant
    Paginate = 5
  end
  
  def index
    @authors = Author.paginate(page: params[:page], per_page: Constant::Paginate)
  end
end
