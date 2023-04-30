namespace :average_calculations do
    desc "Weekly Calculation Average of results"
    # This task calculates the average of results for the current day subject wise and stores it in the DailyResultStat table. It calculates the minimum, maximum and count of results for each subject. 
    task daily: :environment do
      results_data = ResultDatum.where("DATE(timestamp) =?", Date.today).group(:subject).select("CURRENT_DATE as date,subject, MIN(marks) as daily_low, MAX(marks) as daily_high, count(*) as result_count ").as_json(:except => :id)
      results_data.each{|result| 
        DailyResultStat.create(result)
      }
    end
  
    # This task runs weekly to update the monthly average data. 
    # It checks if the current week is the third week of the month and if it is a Monday. 
    # then, it will loop through the result_count_check function 
    # to check if the total result count is less than 200. If it is, it will calculate 
    # the total_needed and update the count_check. If the total result count is greater 
    # than 200, it will update the flag update_count  and update completed to true. If completed 
    # is true, it will query the DailyResultStat table and create a MonthlyAverage record 
    # for each result.
    desc "Monthly Calculation Average of results"
    task weekly: :environment do
      if Date.today.month_week == 3 && Date.today.monday?
        update_count, total_needed, completed, count_check = true, 0, false, 5
        while update_count
          result_count = result_count_check(count_check)
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
          results_data = DailyResultStat.where("date >=?", (Date.today - count_check.day)).group(:subject).select("CURRENT_DATE as date, subject, AVG(daily_low) as monthly_avg_low, AVG(daily_high) as monthly_avg_high, sum(result_count) as monthly_result_count_used ").as_json(:except => :id)
          results_data.each{|result| 
            MonthlyAverage.create(result)
          }
        end
  
      end
    end
  
    def result_count_check days
      result_count = DailyResultStat.where("date >=?", (Date.today - days.day)).select("sum(result_count) as result_count_sum").as_json.first
    end
  
  end
  