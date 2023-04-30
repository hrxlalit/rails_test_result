class CreateDailyResultStats < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_result_stats do |t|
      t.string :subject, null: false
      t.date :date, null: false
      t.decimal :daily_low, scale: 2, precision: 15, default: 0.0
      t.decimal :daily_high, scale: 2, precision: 15, default: 0.0
      t.integer :result_count, default: 0
      t.timestamps
    end
  end
end
