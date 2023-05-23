class DepartmentsController < ApplicationController
  before_action :find_department, only: [ :show, :edit, :update, :destroy ]
  def index
    @departments = Department.all
  end
  def show
  end
  def new
    @department = Department.new
  end
  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to @department
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit 
  end
  def update
    if @department.update(department_params)
      redirect_to @department
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @department.destroy
    redirect_to root_path, status: :see_other
  end

  def find_department
    @department = Department.find(params[:id])
  end
  
  
  private
  def department_params
    params.require(:department).permit(:name, :chairman)
  end
end
