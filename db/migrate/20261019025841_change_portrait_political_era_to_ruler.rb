class ChangePortraitPoliticalEraToRuler < ActiveRecord::Migration[8.1]
  def change
    remove_reference :portraits, :political_era, null: false, foreign_key: true
    add_reference :portraits, :ruler, null: false, foreign_key: true
  end
end
