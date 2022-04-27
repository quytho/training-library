class CommentsController < ApplicationController
  def create
    @books = Book.find_by(id: params[:book_id])
    @comment = @books.comments.create(comment_params)
    redirect_to book_path(@books)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
