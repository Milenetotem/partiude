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

ActiveRecord::Schema.define(:version => 20121126132804) do

  create_table "codigos", :force => true do |t|
    t.string   "codigo"
    t.integer  "user_id"
    t.integer  "empresa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "empresas", :force => true do |t|
    t.string   "logo"
    t.string   "nome"
    t.integer  "codigo_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "grupos", :force => true do |t|
    t.integer  "trajeto_grupo_id"
    t.integer  "user_id"
    t.string   "nome"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "installs", :force => true do |t|
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

  add_index "installs", ["email"], :name => "index_installs_on_email", :unique => true
  add_index "installs", ["reset_password_token"], :name => "index_installs_on_reset_password_token", :unique => true

  create_table "meio_transportes", :force => true do |t|
    t.string   "icone"
    t.string   "nome"
    t.integer  "grupo_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "trajeto_usuario_id"
    t.boolean  "limite",             :default => false
    t.decimal  "limite_qtd"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "grupo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trajeto_grupos", :force => true do |t|
    t.integer  "trajeto_usuario_id"
    t.integer  "grupo_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "trajeto_usuarios", :force => true do |t|
    t.integer  "status_trajeto_id"
    t.integer  "user_id"
    t.integer  "meio_transporte_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "end_origem"
    t.string   "end_destino"
    t.float    "long_origem"
    t.float    "lat_origem"
    t.float    "long_destino"
    t.float    "lat_destino"
    t.integer  "grupo_id"
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
    t.string   "facebook_id"
    t.string   "name"
    t.string   "image"
    t.string   "location"
    t.string   "gender"
    t.integer  "trajeto_usuario_id"
    t.integer  "grupo_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
