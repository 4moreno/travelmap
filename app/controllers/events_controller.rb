class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

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
    @event_owner = @event.user
    @participants = @event.users
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), status: :see_other, notice: "You successfully updated the event: #{@event.name}"
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path, status: :see_other, notice: "You successfully deleted the event: #{@event.name}"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :address, :city_id)
  end

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

end
