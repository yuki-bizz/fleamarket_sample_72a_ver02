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

ActiveRecord::Schema.define(version: 20200616141511) do

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "province",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id", null: false
    t.integer  "brand_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["brand_id"], name: "index_category_brands_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_category_brands_on_category_id", using: :btree
  end

  create_table "credit_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",          null: false
    t.integer  "number",           null: false
    t.integer  "expiration_month", null: false
    t.integer  "expiration_year",  null: false
    t.integer  "security_code",    null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id", using: :btree
  end

  create_table "evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "goods_item_id",   null: false
    t.integer  "user_id",         null: false
    t.integer  "user_icon"
    t.string   "user_evaluation"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["goods_item_id"], name: "index_evaluations_on_goods_item_id", using: :btree
    t.index ["user_id"], name: "index_evaluations_on_user_id", using: :btree
  end

  create_table "goods_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",       null: false
    t.string   "name",          null: false
    t.string   "explanation",   null: false
    t.integer  "category_id",   null: false
    t.integer  "brand_id"
    t.integer  "condition",     null: false
    t.integer  "shipping_fee",  null: false
    t.integer  "area_id",       null: false
    t.integer  "delivery_date", null: false
    t.integer  "selling_price", null: false
    t.integer  "size",          null: false
    t.integer  "delivery_way",  null: false
    t.integer  "status",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["area_id"], name: "index_goods_items_on_area_id", using: :btree
    t.index ["brand_id"], name: "index_goods_items_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_goods_items_on_category_id", using: :btree
    t.index ["user_id"], name: "index_goods_items_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "goods_item_id", null: false
    t.string   "image_url",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["goods_item_id"], name: "index_images_on_goods_item_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "goods_item_id",   null: false
    t.integer  "user_id",         null: false
    t.integer  "payment_way",     null: false
    t.integer  "payment_status",  null: false
    t.integer  "shipping_status", null: false
    t.integer  "delivery_status", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["goods_item_id"], name: "index_orders_on_goods_item_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "statics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "postcode",   null: false
    t.integer  "area_id",    null: false
    t.string   "city",       null: false
    t.string   "address1",   null: false
    t.string   "address2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_user_addresses_on_area_id", using: :btree
    t.index ["user_id"], name: "index_user_addresses_on_user_id", using: :btree
  end

  create_table "user_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_address_id"
    t.integer  "credit_card_id"
    t.integer  "tellphone_number"
    t.string   "self_explanation"
    t.integer  "sales_amount",     null: false
    t.integer  "evaluation_icon",  null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["credit_card_id"], name: "index_user_details_on_credit_card_id", using: :btree
    t.index ["user_address_id"], name: "index_user_details_on_user_address_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "password",                            null: false
    t.string   "nickname",                            null: false
    t.string   "family_name",                         null: false
    t.string   "first_name",                          null: false
    t.string   "family_name_kana",                    null: false
    t.string   "first_name_kana",                     null: false
    t.string   "birth_year",                          null: false
    t.string   "birth_month",                         null: false
    t.string   "birth_day",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "category_brands", "brands"
  add_foreign_key "category_brands", "categories"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "evaluations", "goods_items"
  add_foreign_key "evaluations", "users"
  add_foreign_key "goods_items", "areas"
  add_foreign_key "goods_items", "categories"
  add_foreign_key "goods_items", "users"
  add_foreign_key "images", "goods_items"
  add_foreign_key "orders", "goods_items"
  add_foreign_key "orders", "users"
  add_foreign_key "user_addresses", "areas"
  add_foreign_key "user_addresses", "users"
end
