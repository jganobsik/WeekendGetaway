class GetawaysController < ApplicationController

    def new
          @getaway = Getaway.new
          @getaway.trips.build()
          @getaway.accommodations.build()
          
      end
    
    
      def create
        @getaway = Getaway.new(getaway_params)
        @getaway.user = current_user
        if @getaway.save
          redirect_to getaway_path(@getaway)
        else
          render :new
        end
      end

      def index
        @getaways = Getaway.all
      end

      def flights
        @getaways = Getaway.all.flights
        render :index
      end

      def roadtrips
        @getaways = Getaway.all.road_trips
        render :index
      end

      def show
        set_getaway
        @accommodation = @getaway.accommodations.first
      end

      def edit
        set_getaway
      end

      def update
        set_getaway
          if @getaway.update(getaway_params)
            redirect_to getaway_path(@getaway)
          else
            render :edit
          end
      end

      def destroy
        set_getaway
        @getaway.destroy
        redirect_to getaways_path
      end

      private

      def set_getaway
        @getaway = Getaway.find_by(id: params[:id])
        if !@getaway
          redirect_to getaways_path
        end
      end

      def getaway_params
        params.require(:getaway).permit(:title, :days, :accommodations, :travel_agency_id, :travel_agency_attributes => [:name, :id], :trips_attributes => [:flight, :road_trip, :duration, :id], :accommodations_attributes => [:name, :address, :city, :state, :id] )
      end
    

end

