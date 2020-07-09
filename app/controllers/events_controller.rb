class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
            # is this a ^callback^ ?
    def index
        #byebug
        if params[:user_id]
            # @user = User.find_by(params[:id]) found this on StackOverflow - Doesn't work - only pulls first instance of user
            # ^^ @category = Category.find(params[:id]) / @posts = @category.posts ^^
            @user = User.find_by(:id => current_user)
            #byebug
            @events = @user.events.order_by_date.future_date
        else
            @events = Event.order_by_date.future_date
        end
    end


    def search
        # @events = Event.order_by_date.where("(title || about_content || category) LIKE ?", "%" + params[:search] + "%")
        # ^case sensitive^ or (below) can only search one attr/field
        # @events = Event.order_by_date.where(Event.arel_table[:title].matches("%#{params[:search]}%")) #https://www.scimedsolutions.com/blog/arel-part-i-case-insensitive-searches-with-partial-matching
      
        @events = Event.order_by_date.where(
            %i(title category about_content state)
            .map { |field| Event.arel_table[field].matches("%#{params[:search]}%")}
            .inject(:or)
        )     #https://www.thetopsites.net/article/53226084.shtml
       
    end

    def search_by_state
        @events = Event.order_by_date.where(
            %i(state)
            .map { |field| Event.arel_table[field].matches("%#{params[:search]}%")}
        )
        redirect_to search_path
    end

    def new

        @event = Event.new
    end
    
    def create
        @event = Event.new(event_params)
        if @event.save
            #byebug
            @userevent = @event.users_events.build(user_id: current_user.id, admin: true)
            # @userevent.comment = "Of Course I'm going, I made the event!"
            @userevent.comment = "I'm this events' organizer!"
            @userevent.save
            #byebug
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def show
        #byebug
        if @event == nil
            nested_event
        end

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
        params.require(:event).permit(:title, :category, :address, :city, :state, :zip, :date, :time, :about_content, users_event_attributes:[:comment, :user_id, :event_id])
    end

    def set_event
        @event = Event.find_by(id: params[:id])
    end

    def nested_event
        ue = UsersEvent.find_by(id: params[:id]).event_id
        @event = Event.find_by(id: ue)
    end
    
end
