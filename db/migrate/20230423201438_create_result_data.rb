class CreateResultData < ActiveRecord::Migration[7.0]
  def change
    create_table :results_data do |t|
      t.string :subject, null: false
      t.datetime :timestamp, null: false
      t.decimal :marks, scale: 2, precision: 15, default: 0.0

      t.timestamps
    end
  end
end
