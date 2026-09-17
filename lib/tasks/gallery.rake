# frozen_string_literal: true

namespace :gallery do
  desc "Seed event gallery images from repository for development and production"
  task seed: :environment do
    load Rails.root.join("lib", "tasks", "seed_gallery.rb")
  end
end

namespace :db do
  desc "Seed event gallery images"
  task seed_gallery: :environment do
    load Rails.root.join("lib", "tasks", "seed_gallery.rb")
  end
end
