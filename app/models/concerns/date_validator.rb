class DateValidator <  ActiveModel::Validator

    def validate(record)
        #byebug
        if record.date == nil
            record.errors[:date] << "can't be blank"
        else record.date <= Time.now
            record.errors[:date] << "must be after today"
        end
    end

end