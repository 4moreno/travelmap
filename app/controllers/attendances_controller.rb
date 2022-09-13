class AttendancesController < ApplicationController
  def index
    @attendances = policy_scope(Attendance)
  end

  def create
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
    @attendance.event = @event
    @attendance.user = current_user
    authorize @attendance
    if @attendance.save
      # takes current path and redirects back to it
      redirect_to event_path(@event), status: :see_other, notice: "You successfully joined the event '#{@event.name}'!"
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @event = @attendance.event
    authorize @attendance
    if @attendance.destroy
      redirect_to event_path(@event), status: :see_other, notice: "You don't attend the event '#{@event.name}' anymore"
    end
  end
end
