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

ActiveRecord::Schema.define(version: 2022_04_07_063859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.boolean "status"
    t.integer "price"
    t.bigint "authors_id"
    t.bigint "categories_id"
    t.bigint "publishers_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authors_id"], name: "index_books_on_authors_id"
    t.index ["categories_id"], name: "index_books_on_categories_id"
    t.index ["publishers_id"], name: "index_books_on_publishers_id"
  end

  create_table "borrow_requets", force: :cascade do |t|
    t.date "borrow_date"
    t.date "return_date"
    t.boolean "status"
    t.bigint "users_id"
    t.bigint "books_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["books_id"], name: "index_borrow_requets_on_books_id"
    t.index ["users_id"], name: "index_borrow_requets_on_users_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "users_id", null: false
    t.bigint "books_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["books_id"], name: "index_comments_on_books_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "books_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["books_id"], name: "index_follows_on_books_id"
    t.index ["users_id"], name: "index_follows_on_users_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "books_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["books_id"], name: "index_likes_on_books_id"
    t.index ["users_id"], name: "index_likes_on_users_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer "star"
    t.bigint "users_id"
    t.bigint "books_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["books_id"], name: "index_rates_on_books_id"
    t.index ["users_id"], name: "index_rates_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.string "password_digest"
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "authors", column: "authors_id"
  add_foreign_key "books", "categories", column: "categories_id"
  add_foreign_key "books", "publishers", column: "publishers_id"
  add_foreign_key "borrow_requets", "books", column: "books_id"
  add_foreign_key "borrow_requets", "users", column: "users_id"
  add_foreign_key "comments", "books", column: "books_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "follows", "books", column: "books_id"
  add_foreign_key "follows", "users", column: "users_id"
  add_foreign_key "likes", "books", column: "books_id"
  add_foreign_key "likes", "users", column: "users_id"
  add_foreign_key "rates", "books", column: "books_id"
  add_foreign_key "rates", "users", column: "users_id"
end
