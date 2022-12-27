class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :passenger_name
      t.string :passenger_email

      t.timestamps
    end
  end
end
