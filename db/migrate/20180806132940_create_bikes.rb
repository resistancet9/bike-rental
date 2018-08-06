class CreateBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
      t.string :bike_type
      t.string :description
      t.string :image_url
      t.integer :cost_per_hour
      t.integer :day_rate
      t.integer :weekend_rate
      t.boolean :avail
      t.integer :qty
      t.string :location

      t.timestamps
    end
  end
end
