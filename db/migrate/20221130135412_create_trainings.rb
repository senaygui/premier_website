class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :title, null:false
      t.string :overview, null:false
      t.string :description, null:false
      t.integer :duration
      t.decimal :total_tuition, default: 0.0
      t.string :created_by
      t.string :last_updated_by
      t.timestamps
    end
  end
end
