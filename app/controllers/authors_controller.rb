class AuthorsController < ApplicationController
  PAGE= 5
  def index
    @authors = Author.paginate(page: params[:page], per_page: PAGE)
  end
end
