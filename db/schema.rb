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

ActiveRecord::Schema.define(version: 20200630131933) do

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "customer_id"
    t.string   "card_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          null: false
    t.string   "goods_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
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
    t.integer  "user_id",                     null: false
    t.string   "name",                        null: false
    t.text     "explanation",   limit: 65535, null: false
    t.string   "brand"
    t.string   "condition",                   null: false
    t.string   "shipping_fee",                null: false
    t.string   "province",                    null: false
    t.string   "delivery_way",                null: false
    t.string   "delivery_date",               null: false
    t.integer  "selling_price",               null: false
    t.string   "status"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "category_id",                 null: false
    t.index ["user_id"], name: "index_goods_items_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "goods_item_id", null: false
    t.string   "src",           null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["goods_item_id"], name: "index_images_on_goods_item_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "goods_item_id", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["goods_item_id"], name: "index_orders_on_goods_item_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "statics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "nickname",                               null: false
    t.string   "family_name",                            null: false
    t.string   "first_name",                             null: false
    t.string   "family_name_kana",                       null: false
    t.string   "first_name_kana",                        null: false
    t.integer  "birth_year",                             null: false
    t.integer  "birth_month",                            null: false
    t.integer  "birth_day",                              null: false
    t.string   "delivery_family_name",                   null: false
    t.string   "delivery_first_name",                    null: false
    t.string   "delivery_family_name_kana",              null: false
    t.string   "delivery_first_name_kana",               null: false
    t.integer  "postcode",                               null: false
    t.string   "province",                               null: false
    t.string   "city",                                   null: false
    t.string   "address1",                               null: false
    t.string   "address2"
    t.string   "tellphone_number"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_foreign_key "evaluations", "goods_items"
  add_foreign_key "evaluations", "users"
  add_foreign_key "goods_items", "users"
  add_foreign_key "images", "goods_items"
  add_foreign_key "orders", "goods_items"
  add_foreign_key "orders", "users"
end
