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

ActiveRecord::Schema.define(:version => 20130914100927) do

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
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "credit_line_items", :force => true do |t|
    t.decimal  "amount",     :precision => 8, :scale => 2
    t.integer  "credit_id"
    t.integer  "order_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "credit_line_items", ["credit_id"], :name => "index_credit_line_items_on_credit_id"
  add_index "credit_line_items", ["order_id"], :name => "index_credit_line_items_on_order_id"

  create_table "credits", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "start_balance"
    t.decimal  "balance"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "credits", ["user_id"], :name => "index_credits_on_user_id"

  create_table "dicts", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "model3ds", :force => true do |t|
    t.string   "title"
    t.string   "modelfile"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "number"
    t.decimal  "credit_quantity"
    t.decimal  "total",           :precision => 8, :scale => 2
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "orders", ["number"], :name => "index_orders_on_number"
  add_index "orders", ["state"], :name => "index_orders_on_state"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "pics", :force => true do |t|
    t.string   "title"
    t.string   "photo"
    t.string   "picable_type"
    t.integer  "picable_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "pics", ["picable_id"], :name => "index_pics_on_picable_id"

  create_table "product_relations", :force => true do |t|
    t.string   "rs_name"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "designer"
    t.decimal  "price"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "model3d"
    t.text     "desc"
    t.string   "size"
    t.boolean  "favor",       :default => false
    t.integer  "category_id"
    t.string   "status"
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.text     "address"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rates", :force => true do |t|
    t.integer "score"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rate_id"
    t.integer  "rateable_id"
    t.string   "rateable_type", :limit => 32
    t.text     "free_text"
    t.string   "rater_name"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "ratings", ["rate_id"], :name => "index_ratings_on_rate_id"
  add_index "ratings", ["rateable_id", "rateable_type"], :name => "index_ratings_on_rateable_id_and_rateable_type"

  create_table "service_menus", :force => true do |t|
    t.string   "service_name"
    t.decimal  "service_price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
    t.string   "avatar"
    t.text     "desc"
  end

  create_table "service_menus_tasks", :force => true do |t|
    t.integer "task_id"
    t.integer "service_menu_id"
  end

  add_index "service_menus_tasks", ["service_menu_id"], :name => "index_tasks_services_on_service_id"
  add_index "service_menus_tasks", ["task_id"], :name => "index_tasks_services_on_task_id"

  create_table "service_menus_technicians", :force => true do |t|
    t.integer "technician_id"
    t.integer "service_menu_id"
  end

  add_index "service_menus_technicians", ["service_menu_id"], :name => "index_girls_services_on_service_id"
  add_index "service_menus_technicians", ["technician_id"], :name => "index_girls_services_on_girl_id"

  create_table "tasks", :force => true do |t|
    t.datetime "starttime"
    t.datetime "endtime"
    t.integer  "technician_id"
    t.string   "title"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "intermediary"
    t.decimal  "price"
  end

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

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "node_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
    t.integer  "company_id"
    t.string   "role"
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

  create_table "work_relationships", :force => true do |t|
    t.integer "technician_id"
    t.integer "venue_id"
  end

end
