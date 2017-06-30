class ProjectsController < ApplicationController

 before_action :logged_in_user, only: [:edit, :update, :destroy]

 before_action :correct_user,   only: :destroy

  def show
   @project=Project.find(params[:id])
  end

  def new
    @project=Project.new
  end

  def create
    @project =Project.new(project_params)
    if @project.save
      flash[:success] = "Project created!"
      render 'show'
    else
      render 'new'
    end
  end

  def edit
    @project=Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
   Project.find(params[:id]).destroy
 #  @project.destroy
   flash[:success] = "Project deleted"
   redirect_to @project
  end

  private

    def project_params
      params.require(:project).permit(:name,:description,:user)
    end

    def correct_user
      @project = current_user.projects.find_by(id: params[:id])
      redirect_to root_url if @project.nil?
    end
end

