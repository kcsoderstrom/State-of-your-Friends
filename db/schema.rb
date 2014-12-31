# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141231233159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: true do |t|
    t.string   "body"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "deleted_questions", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deleted_questions", ["question_id"], name: "index_deleted_questions_on_question_id", using: :btree
  add_index "deleted_questions", ["user_id"], name: "index_deleted_questions_on_user_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposed_survey_questions", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposed_survey_questions", ["question_id"], name: "index_proposed_survey_questions_on_question_id", using: :btree
  add_index "proposed_survey_questions", ["user_id"], name: "index_proposed_survey_questions_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "body"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "user_id"
    t.integer  "choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "survey_questions", ["question_id"], name: "index_survey_questions_on_question_id", using: :btree
  add_index "survey_questions", ["user_id"], name: "index_survey_questions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "session_token"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_token"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
