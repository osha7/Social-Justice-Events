class UsersEventsController < ApplicationController

  def create
    #byebug
    users_events = UsersEvent.create(usersevent_params)
    #redirect_to event_path(users_events)
    #byebug
    redirect_to event_path(users_events.event_id)
  end
    
  private
    
  def usersevent_params
    params.require(:users_event).permit(:comment, :event_id, :user_id)
  end 

end
