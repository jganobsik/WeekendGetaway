class GetawaysController < ApplicationController

    def new

        if params[:travel_agency_id] && travel_agency = TravelAgency.find_by_id(params[:travel_agency_id])
          @getaway = travel_agency.getaways.build
        else
          @getaway = Getaway.new
        end
      end
    
    
      def create
        @getaway = current_user.getaways.build(getaway_params)
        if @getaway.save
          redirect_to getaway_path(@getaway)
        else
          render :new
        end
      end

end

