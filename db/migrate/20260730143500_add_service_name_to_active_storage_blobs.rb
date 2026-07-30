class AddServiceNameToActiveStorageBlobs < ActiveRecord::Migration[7.0]
  def up
    unless column_exists?(:active_storage_blobs, :service_name)
      add_column :active_storage_blobs, :service_name, :string
    end

    if column_exists?(:active_storage_blobs, :service_name)
      config_service = Rails.configuration.active_storage.service || "local"
      execute "UPDATE active_storage_blobs SET service_name = '#{config_service}' WHERE service_name IS NULL"
      change_column_null :active_storage_blobs, :service_name, false
    end

    unless table_exists?(:active_storage_variant_records)
      create_table :active_storage_variant_records do |t|
        t.belongs_to :blob, null: false, index: false
        t.string :variation_digest, null: false

        t.index %i[ blob_id variation_digest ], name: "index_active_storage_variant_records_uniqueness", unique: true
        t.foreign_key :active_storage_blobs, column: :blob_id
      end
    end
  end

  def down
    remove_column :active_storage_blobs, :service_name if column_exists?(:active_storage_blobs, :service_name)
    drop_table :active_storage_variant_records if table_exists?(:active_storage_variant_records)
  end
end
