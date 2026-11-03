class AllowNullDynastyOnPeople < ActiveRecord::Migration[8.1]
  def change
    change_column_null :people, :dynasty_id, true
  end
end
