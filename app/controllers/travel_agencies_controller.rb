class TravelAgenciesController < ApplicationController

    def new
        @agency = TravelAgency.new
    end
    
    def create 
        @agency = TravelAgency.new(travel_agency_params)
    
        if @agency.save
            redirect_to dashboard_path
        else 
            render :new
        end
    end

    def index
        @agencies = TravelAgency.all
        respond_to do |f|
            f.html
            f.json {render json: @agencies}
        end
    end

    def show 
        @agency = TravelAgency.find(params[:id])
        respond_to do |f|
            f.html
            f.json {render json: @agency}
        end
    end

private
def travel_agency_params
params.require(:travel_agency).permit(:name)
end
end

