
class User < ApplicationRecord
    has_many :user_events
    has_many :events, through: :user_events
            # @user.events

    has_secure_password

    validates :username, uniqueness: true
    

    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
        end

    end

end
