class MonthlyAverage < ApplicationRecord
  validates :date, :subject, presence: true
end
