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

ActiveRecord::Schema.define(:version => 20130802072453) do


  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.string   "username"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "avatar"
  end

  create_table "create_credit_line_items", :force => true do |t|
    t.integer  "credit_id"
    t.integer  "order_id"
    t.decimal  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end


  add_index "create_credit_line_items", ["credit_id"], :name => "index_create_credit_line_items_on_credit_id"
  add_index "create_credit_line_items", ["order_id"], :name => "index_create_credit_line_items_on_order_id"

  create_table "credits", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "start_balance", :default => 0.0
    t.decimal  "balance",       :default => 0.0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "credits", ["user_id"], :name => "index_credits_on_user_id"

  create_table "dailyposts", :force => true do |t|
    t.integer  "girl_id"
    t.text     "content"
    t.string   "photo"
    t.string   "linkto"

  create_table "model3ds", :force => true do |t|
    t.string   "title"
    t.string   "modelfile"
    t.integer  "product_id"

    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "cost"
    t.string   "state"
  end

  create_table "dicts", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "girls_service_menus", :force => true do |t|
    t.integer "girl_id"
    t.integer "service_menu_id"
  end

  add_index "girls_service_menus", ["girl_id"], :name => "index_girls_service_menus_on_girl_id"
  add_index "girls_service_menus", ["service_menu_id"], :name => "index_girls_service_menus_on_service_menu_id"

  create_table "loser_likes", :force => true do |t|
    t.integer  "loser_id"
    t.integer  "dailypost_id"
    t.string   "title"
    t.string   "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "materials", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.decimal  "price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "attachment"
  end

  create_table "orders", :force => true do |t|
    t.integer  "credit_id"
    t.decimal  "credit_quantity", :precision => 8, :scale => 2
    t.decimal  "total",           :precision => 8, :scale => 2
    t.string   "number"
    t.string   "state"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "content"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "resourceable"
    t.integer  "resourceable_id"
    t.decimal  "price"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "service_menus", :force => true do |t|
    t.string   "service_name"
    t.decimal  "service_price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
    t.string   "avatar"
    t.text     "desc"
  end

  create_table "tasks", :force => true do |t|
    t.datetime "starttime"
    t.datetime "endtime"
    t.integer  "girl_id"
    t.string   "title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "intermediary"
    t.decimal  "price"
  end

  create_table "tasks_service_menus", :force => true do |t|
    t.integer "task_id"
    t.integer "service_menu_id"
  end

  add_index "tasks_service_menus", ["service_menu_id"], :name => "index_tasks_service_menus_on_service_menu_id"
  add_index "tasks_service_menus", ["task_id"], :name => "index_tasks_service_menus_on_task_id"

  create_table "technicians", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "price"
    t.text     "desc"
    t.string   "bwh"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "avatar"
  end


  create_table "technicians_service_menus", :force => true do |t|
    t.integer "technician_id"
    t.integer "service_menu_id"
  end

  add_index "technicians_service_menus", ["service_menu_id"], :name => "index_girls_services_on_service_id"
  add_index "technicians_service_menus", ["technician_id"], :name => "index_girls_services_on_girl_id"

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "node_id"
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
    t.string   "device_token"
    t.string   "username"
    t.string   "token_authenticatable"
    t.boolean  "admin"
    t.integer  "company_id"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
    t.string   "avatar"
  end

  create_table "visit_histories", :force => true do |t|
    t.integer  "dailypost_id"
    t.integer  "user_id"
    t.string   "state"
    t.integer  "visit_count"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "work_relationships", :force => true do |t|
    t.integer "technician_id"
    t.integer "venue_id"
  end

end
