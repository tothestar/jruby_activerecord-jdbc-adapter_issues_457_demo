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

ActiveRecord::Schema.define(:version => 20130906102129) do

  create_table "branches", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :limit => 23, :null => false
    t.datetime "updated_at", :limit => 23, :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "title"
    t.integer  "branch_id",  :limit => 10
    t.datetime "created_at", :limit => 23, :null => false
    t.datetime "updated_at", :limit => 23, :null => false
  end

  create_table "tbl_msg_net_comments", :force => true do |t|
    t.integer  "serialNumber", :limit => 10
    t.string   "workNum"
    t.datetime "dateTime",     :limit => 23
    t.string   "handlingUser"
    t.string   "hdUserPhone"
    t.string   "sName"
    t.string   "area"
    t.string   "responses"
    t.string   "measure"
    t.string   "isOver"
    t.datetime "created_at",   :limit => 23, :null => false
    t.datetime "updated_at",   :limit => 23, :null => false
  end

  create_table "tbl_msg_net_syns", :force => true do |t|
    t.string   "serialNumber"
    t.string   "phoneNum"
    t.string   "customerType"
    t.string   "terminal"
    t.string   "netMark"
    t.string   "problemType"
    t.string   "phenomenon"
    t.string   "problem"
    t.string   "addrName"
    t.string   "expedited"
    t.string   "expeditedTime"
    t.string   "sendUser"
    t.string   "sendUserPhone"
    t.string   "isReject"
    t.string   "rejectReason"
    t.string   "col_userdes"
    t.datetime "col_date",          :limit => 23
    t.string   "col_state"
    t.integer  "col_syn_state",     :limit => 10
    t.datetime "col_sent_datetime", :limit => 23
    t.decimal  "credit"
    t.decimal  "flow"
    t.string   "unittype"
    t.string   "unitname"
    t.string   "unitid"
    t.string   "location"
    t.string   "duration"
    t.datetime "created_at",        :limit => 23, :null => false
    t.datetime "updated_at",        :limit => 23, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "mobile"
    t.string   "name"
    t.string   "position"
    t.integer  "role_id",                :limit => 10
    t.integer  "branch_id",              :limit => 10
    t.integer  "department_id",          :limit => 10
    t.string   "job_no"
    t.text     "note"
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at", :limit => 23
    t.datetime "remember_created_at",    :limit => 23
    t.integer  "sign_in_count",          :limit => 10, :default => 0
    t.datetime "current_sign_in_at",     :limit => 23
    t.datetime "last_sign_in_at",        :limit => 23
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",             :limit => 23,                 :null => false
    t.datetime "updated_at",             :limit => 23,                 :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
