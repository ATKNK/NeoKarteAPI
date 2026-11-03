class AllowNullDynastyOnPoliticalEras < ActiveRecord::Migration[8.1]
  def change
    change_column_null :political_eras, :dynasty_id, true
  end
end
