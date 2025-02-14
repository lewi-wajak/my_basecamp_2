class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin
  
    def index
      @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end
    
  
    def update_role
      user = User.find(params[:id])
      
      if params[:role] == "admin"
        user.add_role(:admin) unless user.has_role?(:admin)
        flash[:notice] = "#{user.email} is now an admin."
      else
        user.remove_role(:admin) if user.has_role?(:admin)
        flash[:notice] = "#{user.email} is now a regular user."
      end
  
      redirect_to admin_users_path
    end
  
    private
  
    def authorize_admin
      redirect_to root_path, alert: "Not authorized" unless current_user.has_role?(:admin)
    end
  end
  