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

ActiveRecord::Schema[7.0].define(version: 2023_11_08_013142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "name"
    t.date "brithday"
    t.string "gender"
    t.string "cpf"
    t.string "telephone"
    t.string "email"
    t.string "education_level"
    t.text "medical_informations"
    t.text "medicines_in_use"
    t.text "processing_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes_parent_guardians", force: :cascade do |t|
    t.bigint "cliente_id"
    t.bigint "parent_guardian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_clientes_parent_guardians_on_cliente_id"
    t.index ["parent_guardian_id"], name: "index_clientes_parent_guardians_on_parent_guardian_id"
  end

  create_table "parent_guardians", force: :cascade do |t|
    t.string "parent_name"
    t.string "cpf"
    t.string "degree_of_kinship"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clientes_parent_guardians", "clientes"
  add_foreign_key "clientes_parent_guardians", "parent_guardians"
end
