class Vacancy < ApplicationRecord

	paginates_per 10

	#assocation
	belongs_to :admin_user



	#validation

	validates :title , :presence => true,
                     :length => { :maximum =>  100}
                         
	validates :description,  :presence => true
                         
	validates :deadline,  :presence => true
                         
	# validates :salary,  :presence => true
                         
	# validates :number_of_employee,  :presence => true
                         
	# validates :catagory,  :presence => true
                         
	# validates :career_level,  :presence => true
                         
	# validates :employment_type,  :presence => true
                         
	# validates :requirement,  :presence => true
                         
	# validates :organization_name,  :presence => true
                         
	# validates :website,  :presence => true
                         
	# validates :email,  :presence => true
                         
	# validates :city,  :presence => true
                         
	# validates :subcity , :presence => true
                         
	validates :address_1 , :presence => true
                         
	validates :phone_number_1 , :presence => true
                         
end



