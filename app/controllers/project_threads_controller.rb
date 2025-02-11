class ProjectThreadsController < ApplicationController
  before_action :set_project
  before_action :set_project_thread, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @threads = @project.project_threads
  end

  def show
  end

  def new
    @project_thread = @project.project_threads.new
  end

  def create
    @project_thread = @project.project_threads.new(thread_params)

    if @project_thread.save
      redirect_to project_project_thread_path(@project, @project_thread), notice: "Thread created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project_thread.update(thread_params)
      redirect_to project_project_thread_path(@project, @project_thread), notice: "Thread updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @project_thread.destroy
    redirect_to project_project_threads_path(@project), notice: "Thread deleted successfully!"
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_project_thread
    @project_thread = @project.project_threads.find(params[:id])
  end

  def thread_params
    params.require(:project_thread).permit(:title)
  end

  def authorize_admin
    unless current_user.has_role?(:admin)
      redirect_to project_project_threads_path(@project), alert: "Only admins can manage threads."
    end
  end
end
