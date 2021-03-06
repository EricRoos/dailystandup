# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_21_210535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "notifiable_type"
    t.bigint "notifiable_id"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "actor_type"
    t.bigint "actor_id"
    t.index ["actor_type", "actor_id"], name: "index_activities_on_actor_type_and_actor_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_activities_on_notifiable_type_and_notifiable_id"
    t.index ["team_id"], name: "index_activities_on_team_id"
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_member_id", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["team_member_id"], name: "index_likes_on_team_member_id"
  end

  create_table "payment_profiles", force: :cascade do |t|
    t.string "provider"
    t.string "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_owner_type"
    t.bigint "payment_owner_id"
    t.index ["payment_owner_type", "payment_owner_id"], name: "poly_payment_owner"
  end

  create_table "product_orders", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_method_source"
    t.string "payment_method_id"
    t.boolean "confirmed"
    t.string "payer_type"
    t.bigint "payer_id"
    t.index ["payer_type", "payer_id"], name: "index_product_orders_on_payer_type_and_payer_id"
    t.index ["product_id"], name: "index_product_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.integer "price_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "standup_reports", force: :cascade do |t|
    t.bigint "team_member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count", default: 0
    t.index ["team_member_id"], name: "index_standup_reports_on_team_member_id"
  end

  create_table "survey_questions", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["survey_id"], name: "index_survey_questions_on_survey_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.bigint "standup_report_id", null: false
    t.bigint "survey_question_id", null: false
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["standup_report_id"], name: "index_survey_responses_on_standup_report_id"
    t.index ["survey_question_id"], name: "index_survey_responses_on_survey_question_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_surveys_on_team_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "team_members_roles", id: false, force: :cascade do |t|
    t.bigint "team_member_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_team_members_roles_on_role_id"
    t.index ["team_member_id", "role_id"], name: "index_team_members_roles_on_team_member_id_and_role_id"
    t.index ["team_member_id"], name: "index_team_members_roles_on_team_member_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "teams"
  add_foreign_key "likes", "team_members"
  add_foreign_key "product_orders", "products"
  add_foreign_key "standup_reports", "team_members"
  add_foreign_key "survey_questions", "surveys"
  add_foreign_key "survey_responses", "standup_reports"
  add_foreign_key "survey_responses", "survey_questions"
  add_foreign_key "surveys", "teams"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
end
