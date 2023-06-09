class Date
    def month_week(start_day = :sunday)
      week_start_format = start_day == :sunday ? '%U' : '%W'
      month_week_start = Date.new(self.year, self.month, 1)
      month_week_start_num = month_week_start.strftime(week_start_format).to_i
      month_week_start_num += 1 if month_week_start.wday > 4 # Skip first week if doesn't contain a Thursday
      month_week_index = self.strftime(week_start_format).to_i - month_week_start_num
      month_week_index + 1 # Add 1 so that first week is 1 and not 0
    end
  end
  