class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :bike, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :days
      t.string :startdate
      t.string :enddate

      t.timestamps
    end
  end
end
