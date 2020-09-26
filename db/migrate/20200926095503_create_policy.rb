class CreatePolicy < ActiveRecord::Migration[6.0]
  def change
    create_table :policies do |t|
      t.text :currency
      t.integer :max_num_of_people
      t.integer :min_rental_day
      t.integer :max_rental_day
    end
  end
end
