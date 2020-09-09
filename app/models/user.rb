
class User < ApplicationRecord
    has_many :users_events, dependent: :destroy
    has_many :events, through: :users_events
            # @user.events

    has_secure_password
    validates_presence_of :username, :email, :password
    validates :username, uniqueness: true
    validates :email, uniqueness: true


    def self.find_or_create_by_omniauth(auth_hash)
        #raise.params
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
            user.username = auth_hash["info"][:nickname]
        end
    end

    def events_where_admin
        #byebug
        #self.users_events.where(admin: true)
        self.users_events.where(admin: true).pluck(:event_id).collect { |ei| ei.event }
        
        # user_events table and we are finding any row where user_id = is equal to this user.id(self)
        # and admin = true
        # taking all the event_id's out of those rows on the user_events table, iterate over those id's [bracket/array of id's]
        # creating an array of event instances from those id's
    end



end


# @user.users_events.where(admin: true)
