class GetawaysController < ApplicationController

    def new
          @getaway = Getaway.new
          @getaway.trips.build()
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

