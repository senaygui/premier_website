class HowTo < ApplicationRecord
    has_many :steps
    accepts_nested_attributes_for :steps, :allow_destroy => true
    has_one_attached :image

    validates :category, presence: true

end
