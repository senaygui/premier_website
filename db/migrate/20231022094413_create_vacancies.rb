class CreateVacancies < ActiveRecord::Migration[5.2]
  def change
    create_table :vacancies do |t|
    	t.references :admin_user, index: true, foreign_key: true
    	t.string :title, null: false, index: true
    	t.text :description, null: false
    	t.datetime :deadline, null: false
    	t.string :salary
    	t.string :number_of_employee
    	t.string :catagory, index: true
    	t.string :career_level
    	t.string :employment_type
    	t.text :requirement
    	t.string :organization_name
			t.string :website
      t.string :email
			t.string :city
      t.string :subcity
      t.string :address_1, null: false
      t.string :address_2
      t.string :phone_number_1, null: false
      t.string :phone_number_2
      t.timestamps
    end
  end
end
