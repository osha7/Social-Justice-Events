class DateValidator <  ActiveModel::Validator

    def validate(record)
        #byebug
        if record.date <= Time.now
            record.errors[:date] << "must be after today"
        end
    end

end