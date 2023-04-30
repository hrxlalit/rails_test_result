Given("a set of results") do
    @results = ResultDatum.where("DATE(timestamp) =?", Date.today).group(:subject).select("CURRENT_DATE as date,subject, MIN(marks) as daily_low, MAX(marks) as daily_high, count(*) as result_count ").as_json(:except => :id)
  end
  
  When("I run the daily task") do
    @results.each{|result| 
      DailyResultStat.create(result)
    }
  end
  
  Then("a result should be created for each subject") do
    expect(DailyResultStat.all.count).to eq(@results.count)
  end
  
  When("I run the weekly task") do
    update_count, total_needed, completed, count_check = true, 0, false, 5
    while update_count
      result_count = result_count_check(count_check)
      result_count = DailyResultStat.where("date >=?", (Date.today - count_check.day)).select("sum(result_count) as result_count_sum").as_json.first
      if (result_count["result_count_sum"].to_f < 200 && result_count["result_count_sum"].to_f > 0)
        total_needed = count_check + (200-(result_count["result_count_sum"])/5)
        count_check = total_needed
        puts "total_needed => #{total_needed}"
      else
        update_count = false
        completed = true
      end
    end
    if completed
      @results = DailyResultStat.where("date >=?", (Date.today - count_check.day)).group(:subject).select("CURRENT_DATE as date, subject, AVG(daily_low) as monthly_avg_low, AVG(daily_high) as monthly_avg_high, sum(result_count) as monthly_result_count_used ").as_json(:except => :id)
      @results.each{|result| 
        MonthlyAverage.create(result)
      }
    end
  end
  
  Then("a result should be created for each subject with the average of daily low and high") do
    expect(MonthlyAverage.all.count).to eq(@results.count)
  end
  
  def result_count_check days
    result_count = DailyResultStat.where("date >=?", (Date.today - days.day)).select("sum(result_count) as result_count_sum").as_json.first
  end