class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def authorize_user
    unless @project.creator == current_user || current_user.has_role?(:admin)
      redirect_to projects_path, alert: "You are not authorized to perform this action."
    end
  end

  
  def index
    @projects = Project.all
  end

  def show
  end

 
  def new
    @project = Project.new
  end

  
  def edit
  end

 
  def create
    @project = current_user.created_projects.build(project_params)  # Associate project with the creator
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:project][:attachments].present?
      @project.attachments.attach(params[:project][:attachments])
    end
  
    respond_to do |format|
      if @project.update(project_params.except(:attachments))  # Exclude attachments from being reset
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  

 
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_path, status: :see_other, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_attachment
    @project = Project.find_by(id: params[:id])
  
    if @project.nil?
      flash[:alert] = "Project not found."
      redirect_to projects_path and return
    end
  
    if params[:attachment].present?
      @project.attachments.attach(params[:attachment])
      flash[:notice] = "Attachment uploaded successfully."
    else
      flash[:alert] = "Please select a file to upload."
    end
  
    redirect_to @project
  end
  

  def destroy_attachment
    @project = Project.find_by(id: params[:project_id])
    return redirect_to projects_path, alert: "Project not found." if @project.nil?
  
    @attachment = @project.attachments.find_by(blob_id: params[:id])  # 🔥 Use blob_id for ActiveStorage attachments
    return redirect_to @project, alert: "Attachment not found." if @attachment.nil?
  
    @attachment.purge
    redirect_to @project, notice: "Attachment deleted successfully."
  end
  
  
  private

   def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name, :project_description, attachments: [])
  end
end