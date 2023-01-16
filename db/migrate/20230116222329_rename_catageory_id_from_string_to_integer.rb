class RenameCatageoryIdFromStringToInteger < ActiveRecord::Migration[7.0]
  def up
    change_column :meals, :category_id, 'integer USING CAST(category_id AS integer)'
  end

  def down
    change_column :meals, :category_id, :string
  end
end
