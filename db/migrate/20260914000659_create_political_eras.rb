class CreatePoliticalEras < ActiveRecord::Migration[8.1]
  def change
    create_table :political_eras do |t|
      t.string :name
      t.references :country, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :full_name
      t.string :full_name_local
      t.references :dynasty, null: false, foreign_key: true
      t.references :government_type, null: false, foreign_key: true
      t.boolean :startdate_approximate
      t.boolean :enddate_approximate

      t.timestamps
    end
  end
end
