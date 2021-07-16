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

ActiveRecord::Schema.define(version: 2021_07_16_061830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoicing_ledger_items", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.string "type"
    t.datetime "issue_date"
    t.string "currency", limit: 3, null: false
    t.decimal "total_amount", precision: 20, scale: 4
    t.decimal "tax_amount", precision: 20, scale: 4
    t.string "status", limit: 20
    t.string "identifier", limit: 50
    t.string "description"
    t.datetime "period_start"
    t.datetime "period_end"
    t.string "uuid", limit: 40
    t.datetime "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_invoicing_ledger_items_on_recipient_id"
    t.index ["sender_id"], name: "index_invoicing_ledger_items_on_sender_id"
  end

  create_table "invoicing_line_items", force: :cascade do |t|
    t.bigint "ledger_item_id"
    t.string "type"
    t.decimal "net_amount", precision: 20, scale: 4
    t.decimal "tax_amount", precision: 20, scale: 4
    t.string "description"
    t.string "uuid", limit: 40
    t.datetime "tax_point"
    t.decimal "quantity", precision: 20, scale: 4
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ledger_item_id"], name: "index_invoicing_line_items_on_ledger_item_id"
  end

  create_table "invoicing_tax_rates", force: :cascade do |t|
    t.string "description"
    t.decimal "rate", precision: 20, scale: 4
    t.datetime "valid_from", null: false
    t.datetime "valid_until"
    t.integer "replaced_by_id"
    t.boolean "is_default"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "menu_category_id"
    t.string "name"
    t.string "description"
    t.bigint "price"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "menu_item_id"
    t.string "menu_item_name"
    t.bigint "menu_item_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "menu_item_quatity"
    t.bigint "user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.bigint "cost"
  end

end
