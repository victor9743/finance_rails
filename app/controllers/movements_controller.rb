class MovementsController < ApplicationController
    def index
        @movements = Movement.all.limit(50)
    end
end
