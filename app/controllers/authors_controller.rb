class AuthorsController < ApplicationController
  def index
    @authors = Author.paginate(page: params[:page], per_page: 5)
  end
end
