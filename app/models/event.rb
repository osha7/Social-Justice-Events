
class Event < ApplicationRecord

    include ActiveModel::Validations

    has_many :users_events
    has_many :users, through: :users_events
                # @event.users

    validates_presence_of :title, :category, :address, :city, :state, :zip, :date, :time, :about_content
    validates :zip, length: { is: 5 }
    validates_numericality_of :zip
    # validate :date_must_be_after_today
    validates_with DateValidator

    # def date_must_be_after_today
    #     if date <= Time.now
    #         errors.add(:date, "must be after today")
    #     end
    # end

    def is_admin?(user)
        self.user_events.where(admin: true).pluck(:user_id).include?(user.id)
    end 
        
end