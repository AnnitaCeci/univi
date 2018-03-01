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

ActiveRecord::Schema.define(version: 20171216010329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asignaturas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "clave"
    t.integer  "creditos"
    t.integer  "horas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carreras", force: :cascade do |t|
    t.string   "nombre"
    t.string   "clave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periodos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "inicio"
    t.string   "fin"
    t.string   "tipo"
    t.boolean  "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_estudios", force: :cascade do |t|
    t.string   "clave"
    t.string   "semestre"
    t.string   "inicio_vigencia"
    t.string   "fin_vigencia"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "carrera_id"
    t.index ["carrera_id"], name: "index_plan_estudios_on_carrera_id", using: :btree
  end

  create_table "semesters", force: :cascade do |t|
    t.integer  "clave"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "plan_estudios", "carreras"
end
