class AddHomepageFeaturesToNews < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :featured, :boolean, default: false, null: false
    add_column :news, :content_type, :string, default: "news", null: false
  end
end
