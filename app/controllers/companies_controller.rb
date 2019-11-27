class CompaniesController < ApplicationController

    def new
        @company = Company.new
    end

    def create
        byebug
    end

    def show
        @employee = Employee.new
        @company = Company.find(params[:id])
    end

    private

    def c_params
        params.require(:company).permit(:name)
    end
end