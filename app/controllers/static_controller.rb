class StaticController < ApplicationController
    def home
    end

    def dashboard
        @getaways = Getaway.last(3)
    end
end
