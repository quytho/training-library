class AuthorsController < ApplicationController
  def index
    @authors = Author.paginate(page: params[:page], per_page: Settings.page)
  end
end
