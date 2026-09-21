class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :name
      t.date :birth
      t.date :death
      t.references :dynasty, null: false, foreign_key: true
      t.boolean :birth_approximate
      t.boolean :deathdate_approximate

      t.timestamps
    end
  end
end
