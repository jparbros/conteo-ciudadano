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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120628090444) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "change_log"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "boxes", :force => true do |t|
    t.integer  "state_id"
    t.integer  "number"
    t.integer  "district"
    t.integer  "section"
    t.string   "location"
    t.boolean  "active"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "address"
    t.string   "references"
    t.string   "district_head"
    t.integer  "nominal_list"
    t.string   "kind"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  add_index "boxes", ["state_id", "section"], :name => "index_boxes_on_state_id_and_section"
  add_index "boxes", ["state_id"], :name => "index_boxes_on_state_id"

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "comment"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "historical_results", :force => true do |t|
    t.integer  "jvm"
    t.integer  "epn"
    t.integer  "amlo"
    t.integer  "quadri"
    t.integer  "nulls"
    t.integer  "others"
    t.integer  "totals"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "result_images", :force => true do |t|
    t.string   "image"
    t.integer  "box_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "exif"
  end

  create_table "results", :force => true do |t|
    t.integer  "pan",                  :default => 0
    t.integer  "pri",                  :default => 0
    t.integer  "prd",                  :default => 0
    t.integer  "pvem",                 :default => 0
    t.integer  "pt",                   :default => 0
    t.integer  "movimiento_ciudadano", :default => 0
    t.integer  "nueva_alianza",        :default => 0
    t.integer  "null",                 :default => 0
    t.integer  "others",               :default => 0
    t.string   "state"
    t.integer  "box_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "pri_pvem",             :default => 0
    t.integer  "prd_pt_mc",            :default => 0
    t.integer  "prd_pt",               :default => 0
    t.integer  "prd_mc",               :default => 0
    t.integer  "pt_mc",                :default => 0
  end

  add_index "results", ["state", "box_id"], :name => "index_results_on_state_and_box_id"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "states", ["name"], :name => "index_states_on_name"

  create_table "tickets", :force => true do |t|
    t.integer  "ticketable_id"
    t.string   "ticketable_type"
    t.string   "issue"
    t.string   "state"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "admin_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
