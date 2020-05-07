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
        set_appointment
    end

    def edit
      set_appointment
    end

    def update
      set_appointment
      if @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
      else
        render :edit
      end
    end

    private

    def appointment_params
      params.require(:appointment).permit(:location, :date, :time, :massage_id)
    end

    def set_appointment
        @appointment = Appointment.find_by(id: params[:id])
    end
end
