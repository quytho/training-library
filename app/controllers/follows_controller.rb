class FollowsController < ApplicationController
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token
  def create
    @follow = Follow.create(follow_params)
    @id = Follow.find_by(book_id: params[:book_id], user_id: params[:user_id])
    respond_to do |format| 
      if @follow.valid?
        format.html 
        format.json { render json: @follow.to_json }
        return
      else
        format.html
        # format.json: { render json: { :error => 'Follow failed', :status_code :not_found } }
      end
    end
    # if @follow.save
    #   redirect_to request.referrer
    # else
    #   redirect_to request.referrer
    # end
  end
  def destroy
    # @followid = Follow.find_by_id(params[:id])
    # @followid.destroy
  end
  private
    def follow_params
      params.permit(:id, :book_id, :user_id)
    end
end