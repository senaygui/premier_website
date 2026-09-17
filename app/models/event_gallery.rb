class EventGallery < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true

  CATEGORIES = [
    "Graduation & Commencement",
    "Academic Workshops",
    "Campus Life",
    "Conferences & Seminars",
    "Student Achievements"
  ].freeze

  scope :homepage_items, -> { where(display_on_homepage: true).order(order_number: :asc, created_at: :desc) }
end
