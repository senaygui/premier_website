class AddCategoryToHowTo < ActiveRecord::Migration[5.2]
  def up
    add_column("how_tos","category", :string)
  end
  def down
    remove_column("how_tos","category")
  end
end
