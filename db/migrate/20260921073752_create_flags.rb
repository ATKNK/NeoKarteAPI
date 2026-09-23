class CreateFlags < ActiveRecord::Migration[8.1]
  def change
    create_table :flags do |t|
      t.date :start_date
      t.date :end_date
      t.references :political_era, null: false, foreign_key: true

      t.timestamps
    end
  end
end
