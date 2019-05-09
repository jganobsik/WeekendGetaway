class GetawaysController < ApplicationController

    def new
          @getaway = Getaway.new
          @getaway.trips.build()
          @getaway.accommodations.build()
          
      end
    
    
      def create
        @getaway = current_user.getaways.build(getaway_params)
        if @getaway.save
          redirect_to getaway_path(@getaway)
        else
          render :new
        end
      end

      def index
        @getaways = Getaway.all
      end

      private

      def set_getaway
        @getaway = Getaway.find_by(id: params[:id])
        if !@getaway
          redirect_to getaways_path
        end
      end

      def getaway_params
        params.require(:getaway).permit(:title, :days, :travel_agency_id, travel_agency_attributes: [:name], trip_attributes: [:flight, :road_trip, :duration], accommodation_attributes: [:name, :address, :city, :state )
      end
    

end

