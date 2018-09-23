class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @projects = Project.all
    json_response(@projects)
  end

  # POST /projects
  def create
    @project = Project.create!(project_params)
    json_response(@project, :created)
  end

  # GET /todos/:id
  def show
    json_response(@project)
  end

  # PUT /todos/:id
  def update
    @project.update(project_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @project.destroy
    head :no_content
  end


  private

  def project_params
    # whitelist params
    params.permit(:name, :created_by)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
