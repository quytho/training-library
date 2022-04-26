class Admin::BorrowRequetsController < ApplicationController
  layout :dynamic_layout
  skip_before_action :verify_authenticity_token
  before_action :get_borrow_request, except: [:index, :new, :create]

  before_action :logged_in_user

  before_action :admin_user

  def index
    @borrow_requets = BorrowRequet.includes(:user, :book)
      .paginate(page: params[:page], per_page: 10)
  end
  
  def update
    if  @borrow_requet.update(status: params[:status])
      flash[:success] = "Successfully"
      redirect_to request.referrer
    end
  end
  private

    def book_params
      params.require(:borrow_requets).permit(:status)
    end
    
    def get_borrow_request
      @borrow_requet = BorrowRequet.find_by_id(params[:id])
      return if @borrow_requet
      flash[:warning] = "That request could not be found"
      redirect_to admin_borrow_requets_path  
    end

    def dynamic_layout
      if true
        "admin"
      else
        "users"
      end
    end

    def update_accept
      params.permit(:id,:status)
    end
end