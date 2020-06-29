
class Event < ApplicationRecord

    include ActiveModel::Validations

    has_many :user_events
    has_many :users, through: :user_events
                # @event.users

    validates_presence_of :title, :category, :address, :city, :state, :zip, :date, :time, :about_content
    validates :zip, length: { is: 5 }
    validates_numericality_of :zip
    # validate :date_must_be_after_today
    validates_with DateValidator

    accepts_nested_attributes_for :users

    # def date_must_be_after_today
    #     if date <= Time.now
    #         errors.add(:date, "must be after today")
    #     end
    # end
        
end
