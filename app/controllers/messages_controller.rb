class MessagesController < ApplicationController
  before_action :set_project_and_thread
  before_action :set_message, only: [:edit, :update, :destroy]
  before_action :authorize_project_member, only: [:create, :edit, :update, :destroy]
  before_action :authorize_user_edit, only: [:edit, :update]  
  before_action :authorize_user_delete, only: [:destroy]      

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
    if @message.user == current_user || current_user.has_role?(:admin)
      @message.destroy
      redirect_to project_project_thread_path(@project, @project_thread), notice: "Message deleted successfully!"
    else
      redirect_to project_project_thread_path(@project, @project_thread), alert: "You are not authorized to delete this message."
    end
  end

  private

  def set_project_and_thread
    @project = Project.find(params[:project_id])
    @project_thread = @project.project_threads.find(params[:project_thread_id])
  end

  def set_message
    @message = @project_thread.messages.find(params[:id])
  end

   def authorize_user_edit
    unless @message.user == current_user
      redirect_to project_project_thread_path(@project, @project_thread), alert: "You can't edit this message."
    end
  end

  
  def authorize_user_delete
    unless @message.user == current_user || current_user.has_role?(:admin)
      redirect_to project_project_thread_path(@project, @project_thread), alert: "You can't delete this message."
    end
  end

  def authorize_project_member
    unless @project.users.include?(current_user) || @project.creator == current_user
      redirect_to project_path(@project), alert: "You must be a project member to perform this action."
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
