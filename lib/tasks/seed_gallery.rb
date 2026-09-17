# frozen_string_literal: true

# ==============================================================================
# Seed Event Galleries from in-repository images (for development & production)
# ==============================================================================

# Search candidate directories inside the application repository first, then local fallback
candidate_dirs = [
  Rails.root.join("lib", "tasks", "gallery_images"),
  Rails.root.join("lib", "tasks", "premier college web photo"),
  File.expand_path("~/Downloads/premier college web photo")
]

images_dir = candidate_dirs.find { |d| Dir.exist?(d) && Dir.glob(File.join(d, "*.{jpg,jpeg,png,webp}")).any? }

if images_dir.nil?
  puts "[Gallery Seed] WARNING: No gallery images directory found in candidate paths:"
  candidate_dirs.each { |d| puts "  - #{d}" }
  return
end

puts "[Gallery Seed] Loading images from: #{images_dir}"

# Detailed manifest for all Premier College event photos
gallery_manifest = [
  {
    filename: "2026-09-16 23.41.54.jpg",
    title: "Annual Graduate Commencement Ceremony",
    category: "Graduation & Commencement",
    caption: "Celebrating the academic dedication and triumphant achievements of Premier College master's candidates.",
    event_date: Date.new(2026, 7, 18),
    order_number: 1 # Slot 0: Top-left wide horizontal banner (perfect wide crowd shot)
  },
  {
    filename: "our award wining studentd.jpg",
    title: "Award-Winning Scholars & Academic Distinction",
    category: "Student Achievements",
    caption: "Celebrating master's candidates who earned top honors and distinctions in their respective fields.",
    event_date: Date.new(2026, 7, 18),
    order_number: 2 # Slot 1: Top-right card
  },
  {
    filename: "presedant.jpg",
    title: "President's Commencement Address & Vision",
    category: "Graduation & Commencement",
    caption: "The College President addressing graduates, faculty, and distinguished guests on leadership and national transformation.",
    event_date: Date.new(2026, 7, 18),
    order_number: 3 # Slot 2: Left column tall vertical portrait (perfect 640px vertical fit)
  },
  {
    filename: "student reperesenative.jpg",
    title: "Student Representative Commencement Remarks",
    category: "Graduation & Commencement",
    caption: "Graduating class representative delivering reflections on perseverance, online collaboration, and future aspirations.",
    event_date: Date.new(2026, 7, 18),
    order_number: 4 # Slot 3: Center top card
  },
  {
    filename: "best student.jpg",
    title: "Outstanding Graduate & Valedictorian Recognition",
    category: "Student Achievements",
    caption: "Recognizing exceptional academic performance, dedication, and capstone excellence among our graduating class.",
    event_date: Date.new(2026, 7, 18),
    order_number: 5 # Slot 4: Right top card
  },
  {
    filename: "2026-09-16 23.42.03.jpg",
    title: "Conferral of Master's Degrees & Honors",
    category: "Graduation & Commencement",
    caption: "Senior leadership conferring official master's degrees to graduates in leadership, management, and business.",
    event_date: Date.new(2026, 7, 18),
    order_number: 6 # Slot 5: Center bottom card
  },
  {
    filename: "2026-09-16 23.42.49.jpg",
    title: "Executive Leadership Colloquium",
    category: "Conferences & Seminars",
    caption: "Senior faculty and Ethiopian industry executives discussing strategic digital transformation in Addis Ababa.",
    event_date: Date.new(2026, 6, 25),
    order_number: 7 # Slot 6: Right bottom card
  },
  {
    filename: "2026-09-16 23.42.56.jpg",
    title: "Master of Business Administration Cohort Orientation",
    category: "Campus Life",
    caption: "Welcoming incoming online graduate scholars to the Premier College academic community.",
    event_date: Date.new(2026, 5, 10),
    order_number: 8
  },
  {
    filename: "2026-09-16 23.44.23.jpg",
    title: "Project Management Methodology Workshop",
    category: "Academic Workshops",
    caption: "Hands-on project execution frameworks and practical leadership skill building for professionals.",
    event_date: Date.new(2026, 4, 15),
    order_number: 9
  },
  {
    filename: "2026-09-16 23.44.33.jpg",
    title: "Faculty Academic Council & Curriculum Review",
    category: "Conferences & Seminars",
    caption: "Continuous quality assurance, accreditation review, and curriculum benchmarking with national standards.",
    event_date: Date.new(2026, 3, 22),
    order_number: 10
  },
  {
    filename: "2026-09-16 23.44.47.jpg",
    title: "Digital Innovation in Higher Education Forum",
    category: "Academic Workshops",
    caption: "Showcasing modern e-learning technologies, LMS tools, and virtual interactive distance classrooms.",
    event_date: Date.new(2026, 2, 14),
    order_number: 11
  },
  {
    filename: "2026-09-16 23.44.59.jpg",
    title: "Premier College Alumni Network Reception",
    category: "Campus Life",
    caption: "Graduates networking with prominent alumni, executive leaders, and career mentors in Addis Ababa.",
    event_date: Date.new(2026, 1, 28),
    order_number: 12
  },
  {
    filename: "2026-09-16 23.45.06.jpg",
    title: "National Accreditation & Regulatory Verification",
    category: "Student Achievements",
    caption: "Reaffirming Premier College educational compliance, institutional quality, and recognized standards.",
    event_date: Date.new(2025, 12, 12),
    order_number: 13
  },
  {
    filename: "2026-09-16 23.45.25.jpg",
    title: "Research Thesis Defense & Graduate Symposium",
    category: "Conferences & Seminars",
    caption: "Scholarly graduate presentations addressing regional economic development, organizational strategy, and governance.",
    event_date: Date.new(2025, 11, 5),
    order_number: 14
  },
  {
    filename: "2026-09-17 17.28.21.jpg",
    title: "Graduate Student Experience & Mentorship Day",
    category: "Campus Life",
    caption: "Personalized faculty mentorship and professional development advisory for working scholars.",
    event_date: Date.new(2025, 10, 20),
    order_number: 15
  },
  {
    filename: "2026-09-17 17.28.28.jpg",
    title: "Applied Leadership & Strategic Governance Workshop",
    category: "Academic Workshops",
    caption: "Interactive case study seminars addressing complex organizational dynamics and ethical decision-making.",
    event_date: Date.new(2025, 9, 15),
    order_number: 16
  },
  {
    filename: "2026-09-17 17.28.59.jpg",
    title: "Dean's List of Academic Distinction",
    category: "Student Achievements",
    caption: "Honoring graduate students who attained the highest cumulative grade point averages in their semester.",
    event_date: Date.new(2025, 8, 30),
    order_number: 17
  }
]

# Track processed files
processed_files = []

# Process manifest items first
gallery_manifest.each do |meta|
  file_path = File.join(images_dir, meta[:filename])
  next unless File.exist?(file_path)

  processed_files << File.expand_path(file_path)

  gallery = EventGallery.find_or_initialize_by(title: meta[:title])
  gallery.category = meta[:category]
  gallery.caption = meta[:caption]
  gallery.event_date = meta[:event_date]
  gallery.display_on_homepage = true
  gallery.order_number = meta[:order_number]

  if !gallery.photo.attached? || gallery.photo.blob.byte_size != File.size(file_path)
    gallery.photo.attach(
      io: File.open(file_path),
      filename: meta[:filename],
      content_type: "image/jpeg"
    )
  end

  gallery.save!
  puts "  [✓] Seeded: #{gallery.title} (Order: #{gallery.order_number}, Category: #{gallery.category})"
end

# Process any additional images in the folder not explicitly listed in manifest
all_images = Dir.glob(File.join(images_dir, "*.{jpg,jpeg,png,webp}")).sort
unprocessed = all_images.reject { |p| processed_files.include?(File.expand_path(p)) }

unprocessed.each_with_index do |file_path, idx|
  base_name = File.basename(file_path, ".*").tr("_", " ").titleize
  order = gallery_manifest.size + idx + 1

  gallery = EventGallery.find_or_initialize_by(title: "Premier College Event: #{base_name}")
  gallery.category ||= "Campus Life"
  gallery.caption ||= "Premier College academic community event highlight."
  gallery.event_date ||= Date.today
  gallery.display_on_homepage = true
  gallery.order_number = order

  if !gallery.photo.attached? || gallery.photo.blob.byte_size != File.size(file_path)
    gallery.photo.attach(
      io: File.open(file_path),
      filename: File.basename(file_path),
      content_type: "image/jpeg"
    )
  end

  gallery.save!
  puts "  [✓] Seeded Extra: #{gallery.title} (Order: #{gallery.order_number})"
end

puts "[Gallery Seed] Done! Total EventGallery items in database: #{EventGallery.count}"
