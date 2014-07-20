class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :load_resource, only: [:show, :edit, :update, :list, :delete, :destroy]

# update this loop after modifying nodes controller
  def show
  end

  def list
  end


  def new
    @project = Project.new
  end

  def edit
  end

  def update
    if @project.update(safe_project_params)
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def create
    @project = Project.new safe_project_params
    @project.user = current_user

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

    def createnode
    @project = Project.find(params[:id])
    @node = @project.nodes.create(node_params)
    
    if @node.save
      redirect_to @node
    else
      render new
    end
  end

  def delete
  end

  def destroy
    @project.destroy
    redirect_to current_user
  end


private
  def safe_project_params
    params.require(:project).permit(:project_name, :description)
  end

  def load_resource
    @project = Project.find(params[:id])
    @nodes = @project.nodes.each
    @nodes_array = []
    @project.nodes.each do |n|
      @nodes_array << n
    end
  end

end
