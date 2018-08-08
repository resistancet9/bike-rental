class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :bike, foreign_key: true
      t.references :user, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.integer :qty
      t.integer :days
      t.integer :hours
      t.integer :weekdays
      t.integer :weekenddays
      t.timestamps
    end
  end
end
