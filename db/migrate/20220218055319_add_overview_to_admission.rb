class AddOverviewToAdmission < ActiveRecord::Migration[5.2]
  def change
    add_column :admissions, :overview, :string
  end
end
