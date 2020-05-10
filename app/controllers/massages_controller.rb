class MassagesController < ApplicationController

    def index
      if logged_in?
        @massages = Massage.all
      else 
        redirect_to login_path
      end
    end

    def show
     set_massage
    end

    def new
      @massage = Massage.new
      render :new
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

    def destroy
      set_massage
      if authorized(@massage)
        @massage.destroy
        redirect_to massages_path
      else 
        redirect_to massages_path
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
