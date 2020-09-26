class CreateSchedulePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_prices do |t|
      t.integer :normal_day_price
      t.integer :weekend_price
      t.integer :cleaning_price
    end
  end
end
