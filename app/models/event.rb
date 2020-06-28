
class Event < ApplicationRecord
    has_many :user_events
    has_many :users, through: :user_events
                # @event.users

    validates_presence_of :title, :category, :address, :city, :state, :zip, :date, :time, :about_content
    
end
