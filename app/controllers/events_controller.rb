class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
  @event = current_user.events.build(event_params)

    if @event.save
    flash[:notice] = "Event '#{@event.title}' created!"
    redirect_to @event
    else
    flash[:alert] = "Error in organizing event! Check the date and if there are any empty fields."
    render 'new'
    end
  end

private

  def event_params
    params.require(:event).permit(:title, :location, :date_time, :itenary, :creator_id)
  end

end
