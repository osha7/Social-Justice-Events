
class Event < ApplicationRecord

    include ActiveModel::Validations

    has_many :users_events
    has_many :users, through: :users_events
                # @event.users

    validates_presence_of :title, :category, :address, :city, :state, :zip, :date, :time, :about_content
    validates :zip, length: { is: 5 }
    validates_numericality_of :zip
    # validate :date_must_be_after_today
    validates_with DateValidator, on: :create
    
    scope :future_date, lambda { where("date > ?", Date.today) }
                # ARel query?
                # scope allows you to specify an ARel query that can be used as a method call to the model (or association objects)
                # equivalent to:
    
    # def date_must_be_after_today       #(((this method went into DateValidator)))
    #     if date <= Time.now
    #         errors.add(:date, "must be after today")
    #     end
    # end

    def is_admin?(user)
        self.users_events.where(admin: true).pluck(:user_id).include?(user.id)
    end 

    # def signed_up_for_event  #(((didn't work, instead used validation in UsersEvent Model)))
    #     #     #byebug
    #         user_id = @event.users_events.each { |eue| eue.user_id }
    #         if user_id == current_user.id
    #             signed_up_for_event
    #         end
    # end
        
end