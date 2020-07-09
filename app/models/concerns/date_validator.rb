class DateValidator <  ActiveModel::Validator

    def validate(record)
        #byebug
        if record.date == nil
            record.errors[:date] << "can't be blank"
        elsif record.date <= Time.now
            record.errors[:date] << "must be after today"
        else
            record.date
        end
    end

end