class EventsController < ApplicationController


   def new
      @event = Event.new 
   end
 
   def show
      @event = Event.find(params[:id])
      @user = current_user 
   end

   def create
      @event = current_user.events.build(event_params)
      if @event.save
         flash[:notice] = "Event was successfully created!"
         redirect_to event_path(@event)
      else
         flash.now[:notice] = 'Something went wrong'
         render :new
      end
   
   end

   def index
      @events = Event.all
      @previous_events = current_user.previous_events
      @upcoming_events = current_user.upcoming_events
   end

   private
 
   def event_params
     params.require(:event).permit(:name, :location, :description, :date)
   end
 
end
 
