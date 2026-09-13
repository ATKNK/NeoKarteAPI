class CreateGovernmentTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :government_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
