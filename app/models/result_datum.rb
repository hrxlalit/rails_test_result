class ResultDatum < ApplicationRecord
  self.table_name = :results_data

  validates :marks, :subject, :timestamp, presence: true
end
