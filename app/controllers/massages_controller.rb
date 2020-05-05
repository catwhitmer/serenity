class MassagesController < ApplicationController

    def index
    end

    def show
    end

    def new
        @massage = Massage.new
    end

    def create
        @massage = Massage.new(massage_params)
    end

    private

    def massage_params
        params.require(:massage).permit(:category, :length)
    end
end
