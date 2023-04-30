# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
data = [{subject: "Science", timestamp: "2022-04-18 12:02:44.678", marks: 123.54},
      {subject: "Science", timestamp: "2022-04-18 13:37:26.678", marks: 120.99},
      {subject: "Science", timestamp: "2022-04-18 15:33:23.678", marks: 126.76},
      {subject: "Science", timestamp: "2022-04-18 17:21:55.678", marks: 119.88},
      {subject: "Science", timestamp: "2022-04-18 17:47:27.678", marks: 125.21}]

data.each{|result|
  ResultDatum.create(result)
}

daily_result_stats = [{date:"2023-04-24", subject:"Science", daily_low:"100.0", daily_high:"126.76", result_count:6},
{date:"2023-04-25", subject:"Science", daily_low:"100.0", daily_high:"126.76", result_count:10},
{date:"2023-04-26", subject:"Science", daily_low:"100.0", daily_high:"126.76", result_count:50},
{date:"2023-04-27", subject:"Science", daily_low:"100.0", daily_high:"126.76", result_count:134},
{date:"2023-04-28", subject:"Science", daily_low:"100.0", daily_high:"126.76", result_count:6}]

daily_result_stats.each{|result|
  DailyResultStat.create(result)
}