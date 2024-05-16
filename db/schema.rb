# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_05_16_122239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accreditations", force: :cascade do |t|
    t.string "accreditation_title", null: false
    t.string "modality", null: false
    t.string "study_level", null: false
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_accreditations_on_program_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.string "role", default: "admin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_admin_users_on_role"
  end

  create_table "admissions", force: :cascade do |t|
    t.string "admission_name", null: false
    t.text "how_to_apply", null: false
    t.text "required_document", null: false
    t.text "payment_process", null: false
    t.text "useful_information"
    t.string "study_level", null: false
    t.string "modality", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "overview"
    t.index ["slug"], name: "index_admissions_on_slug", unique: true
  end

  create_table "almunis", force: :cascade do |t|
    t.string "fullname", null: false
    t.string "sex", null: false
    t.string "phone_number", null: false
    t.string "modality"
    t.string "study_level"
    t.datetime "graduation_date"
    t.string "program_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "student_id"
    t.index ["slug"], name: "index_almunis_on_slug", unique: true
  end

  create_table "branches", force: :cascade do |t|
    t.string "location"
    t.string "name"
    t.integer "phone_number"
    t.integer "second_phone_number"
    t.string "email"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map"
    t.index ["program_id"], name: "index_branches_on_program_id"
  end

  create_table "career_opportunities", force: :cascade do |t|
    t.bigint "program_id"
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_career_opportunities_on_program_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "college_name", null: false
    t.text "background"
    t.text "mission", null: false
    t.text "vision", null: false
    t.text "overview", null: false
    t.datetime "establishment_date", null: false
    t.integer "student_enrolled", null: false
    t.integer "distance_center", null: false
    t.integer "number_of_prorgam", null: false
    t.text "mandate", null: false
    t.text "history", null: false
    t.string "headquarter_address", null: false
    t.string "alternative_address"
    t.string "sub_city"
    t.string "state"
    t.string "region"
    t.string "zone"
    t.string "worda"
    t.string "city"
    t.string "country"
    t.string "phone_number", null: false
    t.string "alternative_phone_number", null: false
    t.string "email", null: false
    t.string "facebook_handle"
    t.string "twitter_handle"
    t.string "instagram_handle"
    t.string "linkedin_handle"
    t.string "map_embed"
    t.string "created_by"
    t.string "last_updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_link"
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "how_tos", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "video_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "marketing_sections", force: :cascade do |t|
    t.string "headline_title"
    t.string "description"
    t.string "page_to_display"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "action_title"
  end

  create_table "news", force: :cascade do |t|
    t.string "news_title", null: false
    t.string "overview", null: false
    t.text "body"
    t.boolean "publish", default: false
    t.string "published_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_news_on_slug", unique: true
  end

  create_table "programs", force: :cascade do |t|
    t.string "program_name", null: false
    t.string "study_level", null: false
    t.string "modality", null: false
    t.text "overview"
    t.text "program_description"
    t.integer "program_duration"
    t.decimal "total_tuition", default: "0.0"
    t.decimal "monthly_tuition", default: "0.0"
    t.string "created_by"
    t.string "last_updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.float "credit_hour"
    t.index ["slug"], name: "index_programs_on_slug", unique: true
  end

  create_table "requests", force: :cascade do |t|
    t.string "name_of_organization"
    t.string "email"
    t.string "phone_number"
    t.string "student_fullname"
    t.boolean "approve"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "track_number"
    t.bigint "almuni_id"
    t.index ["almuni_id"], name: "index_requests_on_almuni_id"
  end

  create_table "section_headlines", force: :cascade do |t|
    t.bigint "college_id"
    t.string "gallery_headline"
    t.string "service_headline"
    t.string "accreditation"
    t.string "testimonial_headline"
    t.string "home_page_video_embed", default: "https://www.youtube.com/embed/Sxuk-tbnNtE"
    t.string "home_page_carousel_headline", default: "YIC Started online masters Registration"
    t.string "home_page_carousel_description", default: "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
    t.string "primary_cta_action", default: "#"
    t.string "secondary_cta_action", default: "about_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_section_headlines_on_college_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name", null: false
    t.string "service_overview", null: false
    t.text "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "fullname", null: false
    t.string "message"
    t.string "job_title", null: false
    t.string "office_name"
    t.text "major_responsibilities"
    t.text "offices_that_answerable_to"
    t.string "office_address"
    t.string "office_phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_staffs_on_slug", unique: true
  end

  create_table "steps", force: :cascade do |t|
    t.string "step_name"
    t.string "step_description"
    t.string "step_video_link"
    t.bigint "how_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["how_to_id"], name: "index_steps_on_how_to_id"
  end

  create_table "training_modules", force: :cascade do |t|
    t.string "title"
    t.bigint "training_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_training_modules_on_training_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "title", null: false
    t.string "overview", null: false
    t.string "description", null: false
    t.integer "duration"
    t.decimal "total_tuition", default: "0.0"
    t.string "created_by"
    t.string "last_updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "deadline", null: false
    t.string "salary"
    t.string "number_of_employee"
    t.string "catagory"
    t.string "career_level"
    t.string "employment_type"
    t.text "requirement"
    t.string "organization_name"
    t.string "website"
    t.string "email"
    t.string "city"
    t.string "subcity"
    t.string "address_1", null: false
    t.string "address_2"
    t.string "phone_number_1", null: false
    t.string "phone_number_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_vacancies_on_admin_user_id"
    t.index ["catagory"], name: "index_vacancies_on_catagory"
    t.index ["title"], name: "index_vacancies_on_title"
  end

  create_table "visitor_comments", force: :cascade do |t|
    t.string "fullname", null: false
    t.string "category", null: false
    t.string "subject", null: false
    t.text "message", null: false
    t.string "email"
    t.string "phone_number"
    t.boolean "display_on_home_page", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "main_testimonial"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "requests", "almunis"
  add_foreign_key "steps", "how_tos"
  add_foreign_key "vacancies", "admin_users"
end
