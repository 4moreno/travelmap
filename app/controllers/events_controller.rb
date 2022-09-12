class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)

    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @events = Event.where(start_time:
      start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.valid?
      @event.save
      redirect_to events_path, status: :see_other, notice: "You successfully created the event: #{@event.name}"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :city_id)
  end

end
