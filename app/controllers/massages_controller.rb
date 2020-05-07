class MassagesController < ApplicationController

    def index
      @massages = Massage.all
    end

    def show
     set_massage
    end

    def new
        @massage = Massage.new
    end

    def create
        @massage = Massage.new(massage_params)
        if @massage.save
          redirect_to massage_path(@massage)
        else
          render :new
      end
    end

    def edit 
      set_massage
    end

    def update
      set_massage
      if @massage.update(massage_params)
        redirect_to massage_path(@massage)
      else
        render :edit
      end
    end

    private

    def massage_params
        params.require(:massage).permit(:category, :length)
    end

    def set_massage
      @massage = Massage.find_by(id: params[:id])
    end
end
