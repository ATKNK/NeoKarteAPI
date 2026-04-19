class CreateDynasties < ActiveRecord::Migration[8.1]
  def change
    create_table :dynasties do |t|
      t.string :name

      t.timestamps
    end
  end
end
