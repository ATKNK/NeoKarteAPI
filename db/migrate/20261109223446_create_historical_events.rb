class CreateHistoricalEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :historical_events do |t|
      t.string :name
      t.string :location
      t.decimal :latitude
      t.decimal :longitude
      t.date :start_date
      t.date :end_date
      t.boolean :startdate_approximate
      t.boolean :enddate_approximate

      t.timestamps
    end
  end
end
