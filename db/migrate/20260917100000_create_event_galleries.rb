class CreateEventGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :event_galleries do |t|
      t.string :title, null: false
      t.text :caption
      t.date :event_date
      t.string :category, default: "Campus Event"
      t.boolean :display_on_homepage, default: true, null: false
      t.integer :order_number, default: 0

      t.timestamps
    end
    add_index :event_galleries, :display_on_homepage
  end
end
