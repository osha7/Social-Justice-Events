class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
            # is this a ^callback^ ?
    def index
        if params[:user_id]
            @user = User.find_by(params[:id])
            #byebug
            # @category = Category.find(params[:id]) @posts = @category.posts
            @events = @user.events.future_date
        else
            @events = Event.future_date
        end
    end

    def new
        if params[:user_id]
            @user = User.find_by(params[:id])
        end
        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        if @event.save
            #byebug
            @userevent = @event.users_events.build(user_id: current_user.id, admin: true)
            @userevent.comment = "Of Course I'm going, I made the event!"
            @userevent.save

            
            # if params[:user_id]
            #     @user = User.find_by(params[:id])
            #     redirect_to user_events_path(@user)
            # else
            #     redirect_to event_path(@event)
            # end
            #byebug
                
        else
            render :new
        end

        # if @alien_group.save
        #     redirect_to params[:planet_id] ? planet_alien_group_path(params[:planet_id], @alien_group) : @alien_group
        #   else
        #     render :new
        #   end

    end

    def show
    end

    def edit
        if @event.is_admin?(current_user)
            render :edit
        else 
            redirect_to events_path
            flash[:message] = "You must be Admin of Event to Edit"
        end 
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
