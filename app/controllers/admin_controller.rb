class AdminController < ApplicationController
  layout :dynamic_layout

  before_action :is_admins
  before_action :logged_in_user

  def is_admins
    unless current_user.is_admin?
      flash[:danger] = "Không the truy cap"
      redirect_to root_url
    end
  end
  
  private 
    def dynamic_layout
      if true
        "admin"
      else
        "users"
      end
    end
end
