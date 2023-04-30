class CreateMonthlyAverages < ActiveRecord::Migration[7.0]
  def change
    create_table :monthly_averages do |t|
      t.string :subject, null: false
      t.date :date, null: false
      t.decimal :monthly_avg_low, scale: 2, precision: 15, default: 0.0
      t.decimal :monthly_avg_high, scale: 2, precision: 15, default: 0.0
      t.integer :monthly_result_count_used, default: 0
      t.timestamps
    end
  end
end
