class MassagesController < ApplicationController

    def index
    end

    def show
    end

    def new
        @massage = Massage.new
    end

    def create
    end

    private

    def massage_params
        params.require(:massage).permit(:category, :length)
    end
end
