class AppointmentsController < ApplicationController

    def index
      if current_user && params[:massage_id] && massage = Massage.find_by(id: params[:massage_id])
        @appointments = massage.appointments.where(user_id: current_user)
      elsif logged_in?
        @appointments = current_user.appointments
      else 
        redirect_to login_path
      end  
    end
    
    def new 
      if current_user && params[:massage_id] && massage = Massage.find_by(id: params[:massage_id])
        @appointment = massage.appointments.build 
      elsif
        current_user && @appointment = Appointment.new
      else
      redirect_to login_path
      end
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
      if authorized?(@appointment) && @appointment.update(appointment_params) 
        redirect_to appointment_path(@appointment)
      else
        redirect_to appointments_path
      end
    end

    def destroy
      set_appointment
      if authorized?(@appointment)
        @appointment.destroy
        redirect_to appointments_path
      else
        redirect_to appointments_path
      end
    end

    private

    def appointment_params
      params.require(:appointment).permit(:location, :date, :time, :massage_id, massage_attributes: [:category, :length])
    end

    def set_appointment
        @appointment = Appointment.find_by(id: params[:id])
    end
end
