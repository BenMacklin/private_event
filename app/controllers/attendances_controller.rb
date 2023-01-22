class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new(user: current_user, event: @event )
    if @attendance.save
       redirect_to event_path(@event), notice: "Attendance for event was successfully created."
     else
       redirect_to root_path, status: :unprocessable_entity
     end
  end

end
