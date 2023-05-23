class EmployeesController < ApplicationController
    before_action :find_department, only: [ :create, :destroy ]
    def create
        @employee = @department.employees.create(employee_params)
        redirect_to department_path(@department)
    end
    def destroy
        @employee = @department.employees.find(params[:id])
        @employee.destroy
        redirect_to department_path(@department), status: :see_other
    end
    def find_department
        @department = Department.find(params[:department_id])
    end
    
    def professor
       @professors = Employee.where(designation: "Lecturer").all
    end
    
    private
    def employee_params
        params.require(:employee).permit(:name, :designation, :salary, :manager_id)
    end
    
    
end
