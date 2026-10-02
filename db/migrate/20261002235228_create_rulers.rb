class CreateRulers < ActiveRecord::Migration[8.1]
  def change
    create_table :rulers do |t|
      t.references :political_era, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.date :start
      t.date :end
      t.boolean :startdate_approximate
      t.boolean :enddate_approximate

      t.timestamps
    end
  end
end
