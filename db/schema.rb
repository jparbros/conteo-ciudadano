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

ActiveRecord::Schema.define(:version => 20120530162653) do

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
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "boxes", :force => true do |t|
    t.integer  "state_id"
    t.integer  "municipality_id"
    t.integer  "number"
    t.integer  "district"
    t.integer  "section"
    t.string   "location"
    t.boolean  "active"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "ticket_voting_file_name"
    t.string   "ticket_voting_content_type"
    t.integer  "ticket_voting_file_size"
    t.datetime "ticket_voting_updated_at"
    t.string   "address"
    t.string   "references"
  end

  add_index "boxes", ["state_id", "section"], :name => "index_boxes_on_state_id_and_section"
  add_index "boxes", ["state_id"], :name => "index_boxes_on_state_id"

  create_table "results", :force => true do |t|
    t.integer  "pan"
    t.integer  "pri"
    t.integer  "prd"
    t.integer  "pvem"
    t.integer  "pt"
    t.integer  "movimiento_ciudadano"
    t.integer  "nueva_alianza"
    t.integer  "null"
    t.integer  "others"
    t.integer  "state"
    t.integer  "box_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

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

end
