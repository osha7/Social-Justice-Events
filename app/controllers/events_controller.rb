class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        if @event.save
            #byebug
            @userevent = @event.users_events.build(user_id: current_user.id, admin: true)
            @userevent.comment = "Of Course I'm going, I made the event!"
            @userevent.save
            redirect_to event_path(@event)
            #byebug
                
        else
            render :new
        end

    end

    def show
    #    @users_event = @event.users_events.build 
    #    @users_event.save
    #    @users_event.user = current_user
    end

    def edit
        if @event.is_admin?(current_user)
            render :edit
        else 
            redirect_to events_path
            flash[:message] = "You must be Admin of Event to Edit"
        end 
        #byebug
        # if current_user.events_where_admin
        # else
        #     render :index
        # end
    end
    
    def update
         # if @user.admin
        if @event.is_admin?(current_user)
            if @event.update(event_params)
                redirect_to event_path(@event)
            else
                render :edit
            end
        else
            redirect_to events_path
            flash[:message] = "You must be Admin of Event to Edit"
        end 
    end

    def destroy
        # if @user.admin
        if @event.is_admin?(current_user)
            if @event.destroy
                redirect_to events_path
            else
                render :index
            end
        else
            redirect_to events_path
            flash[:message] = "You must be Admin of Event to Edit"
        end 
    end

    private

    def event_params
        params.require(:event).permit(:title, :category, :address, :city, :state, :zip, :date, :time, :about_content, users_event_attributes:[:comment])
    end

    def set_event
        @event = Event.find_by(id: params[:id])
    end
    
end
