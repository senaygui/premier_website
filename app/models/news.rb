class News < ApplicationRecord
    validates :content_type, inclusion: { in: %w[news event] }
    scope :homepage_features, -> { where(publish: true, featured: true).order(created_at: :desc, id: :desc) }

	##validations
		validates :news_title, :presence => true 
		validates :overview, :presence => true

		has_one_attached :photo

	extend FriendlyId
    friendly_id :news_title
end
