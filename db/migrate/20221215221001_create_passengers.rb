class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :passenger_name, null: false
      t.string :passenger_email, null: false

      t.timestamps
    end
  end
end
