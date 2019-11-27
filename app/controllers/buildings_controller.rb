class BuildingsController < ApplicationController

    def show
        @building = Building.find(params[:id])
    end

    def index
        @buildings = Building.all.order(:name)
    end

    def edit
        @building = Building.find(params[:id])
    end

    def update
        @building = Building.find(params[:id])

        if @building.update(b_params)
            redirect_to building_path(@building)
        else
            render :new
        end
    end

    private

    def b_params
        params.require(:building).permit(:name, :address, :country, :rent_per_floor, :number_of_floors)
    end
end