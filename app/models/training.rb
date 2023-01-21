class Training < ApplicationRecord
  has_many :training_modules
  accepts_nested_attributes_for :training_modules, :allow_destroy => true
  has_one_attached :photo
end
