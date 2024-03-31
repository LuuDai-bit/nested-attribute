# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_03_31_090741) do
  create_table "answer_details", force: :cascade do |t|
    t.string "detail", null: false
    t.integer "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_details_on_answer_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "answer", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "question_question_tags", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "question_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_question_tags_on_question_id"
    t.index ["question_tag_id"], name: "index_question_question_tags_on_question_tag_id"
  end

  create_table "question_tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_name"], name: "index_question_tags_on_tag_name", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "question", null: false
    t.boolean "require_flg", null: false
    t.integer "question_type", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answer_details", "answers"
  add_foreign_key "answers", "questions"
  add_foreign_key "question_question_tags", "question_tags"
  add_foreign_key "question_question_tags", "questions"
end
