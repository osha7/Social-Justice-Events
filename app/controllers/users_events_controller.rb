class UsersEventsController < ApplicationController

  def create
    # #byebug
    # users_events = UsersEvent.create(usersevent_params)
    # #redirect_to event_path(users_events)
    # #byebug
    # redirect_to event_path(users_events.event_id)

    users_events = UsersEvent.new(usersevent_params)
      if users_events.save
        flash[:notice] =  "Thank you for mobilizing with us!"
        redirect_to event_path(users_events.event_id)
      else 
        flash[:notice] =  "You have already RSVP'd!"
        redirect_to event_path(users_events.event_id)
      end
  end
    
  private
    
  def usersevent_params
    params.require(:users_event).permit(:comment, :event_id, :user_id)
  end 

end
