class EmployeesController < ApplicationController

    def create
        @employee = Employee.new(e_params)

        if @employee.save
            redirect_to company_path(@employee.company_id)
        else
            render :"companies/show"
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to company_path(@employee.company_id)
    end


    private

    def e_params
        params.require(:employee).permit(:name, :title, :company_id)
    end
end