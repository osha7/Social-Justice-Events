
class Event < ApplicationRecord

    include ActiveModel::Validations

    has_many :users_events, dependent: :destroy
    has_many :users, through: :users_events
                # @event.users

    validates_presence_of :title, :category, :address, :city, :state, :zip, :time, :about_content
    validates :zip, length: { is: 5 }
    validates_numericality_of :zip
                # validate :date_must_be_after_today
    validates_with DateValidator, on: :create
    
    scope :future_date, lambda { where("date > ?", Date.today) }
                # ARel query?
                # scope allows you to specify an ARel query that can be used as a method call to the model (or association objects)
                # equivalent to: 
    scope :order_by_date, -> {order("date")}

    # scope :users_state, -> { where("state" == )}
    
                # def date_must_be_after_today       #(((this method went into DateValidator)))
                #     if date <= Time.now
                #         errors.add(:date, "must be after today")
                #     end
                # end

    def is_admin?(user)
        self.users_events.where(admin: true).pluck(:user_id).include?(user.id)
    end 

    def self.search(params)
        # @events = Event.order_by_date.where("(title || about_content || category) LIKE ?", "%" + params[:search] + "%")
        # ^case sensitive in PG^ or (below) can only search one attr/field
        # @events = Event.order_by_date.where(Event.arel_table[:title].matches("%#{params[:search]}%")) #https://www.scimedsolutions.com/blog/arel-part-i-case-insensitive-searches-with-partial-matching
      
        @events = Event.order_by_date.where(
            %i(title category about_content state)
            .map { |field| Event.arel_table[field].matches("%#{params[:search]}%")}
            .inject(:or)
        )     #https://www.thetopsites.net/article/53226084.shtml
       
    end
        
end