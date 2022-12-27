class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.timestamps
      t.references :flight, null: false, foreign_key: true
    end
  end
end
