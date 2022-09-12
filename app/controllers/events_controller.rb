class EventsController < ApplicationController
  def index
    @events = policy_scope(Event)

    if params[:city].present?
      @events = @events.filter_by_city(params[:city])
    else
      @events
    end
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @events = @events.where(start_time:
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

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :address, :city_id)
  end

end
