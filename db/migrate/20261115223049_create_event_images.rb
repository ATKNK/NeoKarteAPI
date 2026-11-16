class CreateEventImages < ActiveRecord::Migration[8.1]
  def change
    create_table :event_images do |t|
      t.references :historical_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
