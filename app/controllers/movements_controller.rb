class MovementsController < ApplicationController
    def index
        @movements = Movement.all.limit(50)
    end

    def new 
    end
end
