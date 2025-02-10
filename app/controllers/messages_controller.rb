class MessagesController < ApplicationController
    before_action :set_project_and_thread
    before_action :set_message, only: [:edit, :update, :destroy]
    before_action :check_project_membership, only: [:create, :edit, :update, :destroy]
    before_action :authorize_user, only: [:edit, :update, :destroy]
  
    def create
      @message = @project_thread.messages.new(message_params)
      @message.user = current_user
  
      if @message.save
        redirect_to project_project_thread_path(@project, @project_thread), notice: "Message sent successfully!"
      else
        redirect_to project_project_thread_path(@project, @project_thread), alert: "Failed to send message."
      end
    end
  
    def edit
    end
  
    def update
      if @message.update(message_params)
        redirect_to project_project_thread_path(@project, @project_thread), notice: "Message updated successfully!"
      else
        render :edit
      end
    end
  
    def destroy
      @message.destroy
      redirect_to project_project_thread_path(@project, @project_thread), notice: "Message deleted successfully!"
    end
  
    private
  
    def set_project_and_thread
      @project = Project.find(params[:project_id])
      @project_thread = @project.project_threads.find(params[:project_thread_id])
    end
  
    def set_message
      @message = @project_thread.messages.find(params[:id])
    end
  
    def check_project_membership
      unless @project.users.include?(current_user)
        redirect_to project_project_thread_path(@project, @project_thread), alert: "You can't modify messages in this thread."
      end
    end
  
    def authorize_user
      unless @message.user == current_user || current_user.has_role?(:admin)
        redirect_to project_project_thread_path(@project, @project_thread), alert: "You can't edit or delete this message."
      end
    end
  
    def message_params
      params.require(:message).permit(:content)
    end
  end
  