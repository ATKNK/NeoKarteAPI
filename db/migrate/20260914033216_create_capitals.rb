class CreateCapitals < ActiveRecord::Migration[8.1]
  def change
    create_table :capitals do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :political_era, null: false, foreign_key: true
      t.boolean :startdate_approximate
      t.boolean :enddate_approximate

      t.timestamps
    end
  end
end
