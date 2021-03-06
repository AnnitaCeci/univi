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

ActiveRecord::Schema.define(version: 20180803175922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnos", force: :cascade do |t|
    t.string "clave"
    t.string "curp"
    t.string "nombre"
    t.string "apellido_paterno"
    t.string "apellido_materno"
    t.string "correo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "asignaturas", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "clave"
    t.integer "creditos"
    t.integer "horas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "semester_id"
    t.bigint "plan_estudio_id"
    t.index ["plan_estudio_id"], name: "index_asignaturas_on_plan_estudio_id"
    t.index ["semester_id"], name: "index_asignaturas_on_semester_id"
  end

  create_table "carreras", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "clave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.bigint "asignatura_id"
    t.bigint "periodo_id"
    t.bigint "profesor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignatura_id"], name: "index_cursos_on_asignatura_id"
    t.index ["periodo_id"], name: "index_cursos_on_periodo_id"
    t.index ["profesor_id"], name: "index_cursos_on_profesor_id"
  end

  create_table "grades", force: :cascade do |t|
    t.float "parcial1"
    t.float "parcial2"
    t.float "average"
    t.float "extra1"
    t.float "extra2"
    t.bigint "alumno_id"
    t.bigint "periodo_id"
    t.bigint "record_id"
    t.bigint "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_grades_on_alumno_id"
    t.index ["curso_id"], name: "index_grades_on_curso_id"
    t.index ["periodo_id"], name: "index_grades_on_periodo_id"
    t.index ["record_id"], name: "index_grades_on_record_id"
  end

  create_table "periodos", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "inicio"
    t.string "fin"
    t.string "tipo"
    t.boolean "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_estudios", id: :serial, force: :cascade do |t|
    t.string "clave"
    t.string "semestre"
    t.string "inicio_vigencia"
    t.string "fin_vigencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "carrera_id"
    t.index ["carrera_id"], name: "index_plan_estudios_on_carrera_id"
  end

  create_table "profesors", force: :cascade do |t|
    t.string "rfc"
    t.string "nombre"
    t.string "apellido_paterno"
    t.string "apellido_materno"
    t.string "grado_academico"
    t.string "grado_academico_abreviado"
    t.string "correo"
    t.string "telefono"
    t.string "domicilio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.bigint "alumno_id"
    t.bigint "periodo_id"
    t.bigint "plan_estudio_id"
    t.bigint "semester_id"
    t.integer "studentship"
    t.float "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_records_on_alumno_id"
    t.index ["periodo_id"], name: "index_records_on_periodo_id"
    t.index ["plan_estudio_id"], name: "index_records_on_plan_estudio_id"
    t.index ["semester_id"], name: "index_records_on_semester_id"
  end

  create_table "semesters", id: :serial, force: :cascade do |t|
    t.integer "clave"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "asignaturas", "plan_estudios"
  add_foreign_key "asignaturas", "semesters"
  add_foreign_key "cursos", "asignaturas"
  add_foreign_key "cursos", "periodos"
  add_foreign_key "cursos", "profesors"
  add_foreign_key "grades", "alumnos"
  add_foreign_key "grades", "cursos"
  add_foreign_key "grades", "periodos"
  add_foreign_key "grades", "records"
  add_foreign_key "plan_estudios", "carreras"
  add_foreign_key "records", "alumnos"
  add_foreign_key "records", "periodos"
  add_foreign_key "records", "plan_estudios"
  add_foreign_key "records", "semesters"
end
