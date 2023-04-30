class DailyResultStat < ApplicationRecord
  validates :date, :subject, presence: true
end
