class ProjectsController < ApplicationController
  layout 'application'
  before_action :set_project, only: [:edit, :show, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end
  end

  # POST /projects
  def create
    @project = Project.create!(project_params)
    respond_to do |format|
      format.html
      format.json { render json: @project, status: :created }
    end
  end

  # GET /projects/:name
  def show
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  # PUT /projects/:name
  def update
    @project.update(project_params)
    head :no_content
  end

  # DELETE /projects/:name
  def destroy
    @project.destroy
    head :no_content
  end

  def edit
  end


  private

  def project_params
    # whitelist params
    params.permit(:name, :created_by)
  end

  def set_project
    @project = Project.find_by!(name: params[:name])
  end

end
