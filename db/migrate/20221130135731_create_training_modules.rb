class CreateTrainingModules < ActiveRecord::Migration[5.2]
  def change
    create_table :training_modules do |t|
      t.string :title
      t.belongs_to :training, index: true
      t.timestamps
    end
  end
end
