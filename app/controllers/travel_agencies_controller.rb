class TravelAgenciesController < ApplicationController

    def new
        @agency = TravelAgency.new
    end
    
    def create 
        @agency = TravelAgency.new(travel_agency_params)
    
        if @agency.save
            redirect_to root_path
        else 
            render :new
        end
    end

    def index
        @agencies = TravelAgency.all
    end

private
def travel_agency_params
params.require(:travel_agency).permit(:name)
end
end

