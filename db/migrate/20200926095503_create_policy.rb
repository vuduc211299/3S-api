class CreatePolicy < ActiveRecord::Migration[6.0]
  def change
    create_table :policies do |t|
      t.text :currency
      t.integer :max_num_of_people
      t.integer :rental_day
    end
  end
end
