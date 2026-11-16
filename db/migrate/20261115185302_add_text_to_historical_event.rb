class AddTextToHistoricalEvent < ActiveRecord::Migration[8.1]
  def change
    add_column :historical_events, :description, :text
  end
end
