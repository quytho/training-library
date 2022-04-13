class AuthorsController < ApplicationController
  def index
    @author = Author.all
  end
end
