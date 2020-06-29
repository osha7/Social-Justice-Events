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
            @userevent = @event.user_events.build(user_id: current_user.id, admin: true)
            @userevent.save
            redirect_to events_path
        else
            render :new
        end
        

    end

    def show
       
    end

    def edit
        #byebug
        # if current_user.events_where_admin
        # else
        #     render :index
        # end
    end
    
    def update
         # if @user.admin
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render :edit
        end
       
    end

    def destroy
        # if @user.admin
        if @event.destroy
            redirect_to events_path
        else
            render :index
        end

    end

    private

    def event_params
        params.require(:event).permit(:title, :category, :address, :city, :state, :zip, :date, :time, :about_content)
    end

    def set_event
        @event = Event.find_by(id: params[:id])
    end

    

end
