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

ActiveRecord::Schema[7.0].define(version: 2023_07_17_015022) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aventuras", force: :cascade do |t|
    t.string "titulo"
    t.string "descripcion"
    t.datetime "fecha"
    t.string "imagen"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_aventuras_on_country_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "contenido"
    t.bigint "aventura_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aventura_id"], name: "index_comentarios_on_aventura_id"
    t.index ["user_id"], name: "index_comentarios_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.bigint "aventura_id", null: false
    t.bigint "user_id", null: false
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aventura_id"], name: "index_reactions_on_aventura_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "aventuras", "countries"
  add_foreign_key "comentarios", "aventuras"
  add_foreign_key "comentarios", "users"
  add_foreign_key "reactions", "aventuras"
  add_foreign_key "reactions", "users"
end
