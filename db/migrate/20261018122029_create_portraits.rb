class CreatePortraits < ActiveRecord::Migration[8.1]
  def change
    create_table :portraits do |t|
      t.references :political_era, null: false, foreign_key: true

      t.timestamps
    end
  end
end
