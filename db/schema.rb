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

ActiveRecord::Schema[7.0].define(version: 2022_07_28_152251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_books", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_author_books_on_author_id"
    t.index ["book_id"], name: "index_author_books_on_book_id"
  end

  create_table "authors", force: :cascade do |t|
    t.text "bio"
    t.string "name"
    t.string "gender"
    t.jsonb "wikipedia", default: {}, null: false
    t.text "summary"
    t.datetime "born"
    t.datetime "died"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "content_name"
    t.string "isbn"
    t.integer "year"
    t.string "language_code"
    t.string "images", default: [], array: true
    t.string "category"
    t.text "plot"
    t.string "genres", default: [], array: true
    t.string "copyright"
    t.string "title"
    t.jsonb "wikipedia", default: {}, null: false
    t.float "average_rating"
    t.integer "rating_count"
    t.jsonb "goodreads", default: {}, null: false
    t.string "similar_books", default: [], array: true
    t.text "description"
    t.string "loc_class"
    t.jsonb "gutenberg", default: {}, null: false
    t.integer "pages"
    t.string "language"
    t.string "isbn13"
    t.datetime "release_date"
    t.bigint "author_id", null: false
    t.string "cover"
    t.text "summary"
    t.boolean "content_cleaned"
    t.string "classes", default: [], array: true
    t.boolean "content_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["pages"], name: "index_books_on_pages"
    t.index ["title"], name: "index_books_on_title"
    t.index ["year"], name: "index_books_on_year"
  end

  add_foreign_key "author_books", "authors"
  add_foreign_key "author_books", "books"
  add_foreign_key "books", "authors"
end
