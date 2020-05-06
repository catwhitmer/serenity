class AppointmentsController < ApplicationController

    def index
        @appointments = Appointment.all
    end
    
    def new 
        @appointment = Appointment.new
    end 

    def create
        @appointment = current_user.appointments.build(appointment_params)
        if @appointment.save
          redirect_to appointment_path(@appointment)
        else
          render :new
        end
    end 

    def show
        @appointment = Appointment.find_by(id: params[:id])
    end


    private

    def appointment_params
      params.require(:appointment).permit(:location, :date, :time)
    end
end
