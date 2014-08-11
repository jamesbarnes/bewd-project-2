class NodesController < ApplicationController
  before_filter :load_resource, only: [:show, :delete, :destroy]
  before_filter :authenticate_user!

# maybe remove this after moving to projects controller
  def index
    @nodes = Node.all
    @nodes_array = []
    @nodes.each do |n|
      @nodes_array << n
    end
  end

  def show
  end

  def new
    @nodes = Node.all
    @node = Node.new
  end

  def create
    @project = Project.find(params[:project_id])
    @node = @project.nodes.create(node_params)
    
    if @node.save
      redirect_to @project
    else
      render new
    end
  end

#ask about update help here 
  def update
    @node = Node.find(params[:id])
    @node.update(node_params)
    @project = Project.find(params[:project_id])
    redirect_to list_project_path
  end

  def batchupdate
    @batch = eval(params.to_s)
    binding.pry
  end

  def edit
    @node = Node.find(params[:id])
    @nodes = Project.find(params[:project_id]).nodes
    @project = Project.find(params[:project_id])
  end

  def delete
  end

  def destroy
    @node.destroy
    redirect_to @project
  end

  private

  def node_params
    params.require(:node).permit(:name, :parent)
  end

  def load_resource
    @node = Node.find(params[:id])
    @project = Project.find(params[:project_id])
  end
end