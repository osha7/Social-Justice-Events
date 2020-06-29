
class User < ApplicationRecord
    has_many :user_events
    has_many :events, through: :user_events
            # @user.events

    has_secure_password
    validates_presence_of :name, :username, :email, :password
    validates :username, uniqueness: true
    validates :email, uniqueness: true

    accepts_nested_attributes_for :events



    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

    def events_where_admin
        self.user_events.where(admin: true).pluck(:event_id).collect { |ei| Event.find_by(id: ei) }
        #user_events table and we are finding any row where user_id = is equal to this user.id(self)
        # and admin = true
        #taking all the event_id's out of those rows on the user_events table, iterate over those id's [bracket/array of id's]
        # creating an array of event instances from those id's
    end

end
