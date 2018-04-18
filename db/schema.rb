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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180418035701) do

  create_table "canciones_votars", force: :cascade do |t|
    t.integer  "id_emisora"
    t.string   "cancion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emisoras", force: :cascade do |t|
    t.string   "nombre"
    t.string   "link"
    t.integer  "id_admin"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "descripcion"
  end

  create_table "localizacion_stats", force: :cascade do |t|
    t.integer  "id_user"
    t.integer  "id_emisora"
    t.string   "ciudad"
    t.string   "pais"
    t.float    "longitud"
    t.float    "latitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trendings", force: :cascade do |t|
    t.integer  "id_emisora"
    t.integer  "posicion"
    t.string   "cancion"
    t.string   "artista"
    t.string   "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ubicacions", force: :cascade do |t|
    t.integer  "id_user"
    t.integer  "id_emisora"
    t.float    "longitud"
    t.float    "latitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_emisoras", force: :cascade do |t|
    t.integer  "idUser"
    t.integer  "idEmisora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "authentication_token",   limit: 30
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votaciones_historicos", force: :cascade do |t|
    t.integer  "id_emisora"
    t.string   "cancion"
    t.integer  "votos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votos", force: :cascade do |t|
    t.integer  "id_user"
    t.integer  "id_emisora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "id_cancion"
  end

end
