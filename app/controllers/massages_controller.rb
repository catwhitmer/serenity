class MassagesController < ApplicationController

    def index
      @massages = Massage.all
    end

    def show
      @massage = Massage.find_by(id: params[:id])
    end

    def new
        @massage = Massage.new
    end

    def create
        @massage = Massage.new(massage_params)
        @massage.save
        redirect_to massage_path(@massage)
    end

    private

    def massage_params
        params.require(:massage).permit(:category, :length)
    end
end
