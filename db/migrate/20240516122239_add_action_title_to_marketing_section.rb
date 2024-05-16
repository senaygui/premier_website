class AddActionTitleToMarketingSection < ActiveRecord::Migration[5.2]
  def up
    add_column("marketing_sections","action_title", :string)
  end
  def down
    remove_column("marketing_sections","action_title")
  end
end
