class EventsController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.create(event_params)
    redirect_to new_event_invite_url(@event)
  end

   def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all  
  end 

  private
   
    def event_params
      params.require(:event).permit(:name)
    end
end
