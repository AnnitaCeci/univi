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

ActiveRecord::Schema.define(version: 20180425165023) do

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
    t.bigint "plan_estudio_id"
    t.bigint "semester_id"
    t.index ["plan_estudio_id"], name: "index_asignaturas_on_plan_estudio_id"
    t.index ["semester_id"], name: "index_asignaturas_on_semester_id"
  end

  create_table "carreras", id: :serial, force: :cascade do |t|
    t.string "nombre"
    t.string "clave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "grupo"
    t.bigint "asignatura_id"
    t.bigint "teacher_id"
    t.bigint "period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignatura_id"], name: "index_courses_on_asignatura_id"
    t.index ["period_id"], name: "index_courses_on_period_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
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

  create_table "inscriptions", force: :cascade do |t|
    t.integer "beca"
    t.bigint "course_id"
    t.bigint "student_id"
    t.bigint "period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_inscriptions_on_course_id"
    t.index ["period_id"], name: "index_inscriptions_on_period_id"
    t.index ["student_id"], name: "index_inscriptions_on_student_id"
  end

  create_table "inscriptions_courses", force: :cascade do |t|
    t.bigint "inscription_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_inscriptions_courses_on_course_id"
    t.index ["inscription_id"], name: "index_inscriptions_courses_on_inscription_id"
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

  create_table "periods", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.integer "weeks"
    t.date "first_evaluation_date"
    t.date "second_evaluation_date"
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
    t.integer "carrera_id"
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

  create_table "statutes", force: :cascade do |t|
    t.float "approving_grade"
    t.boolean "subject_retest"
    t.integer "evaluations"
    t.bigint "carrera_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrera_id"], name: "index_statutes_on_carrera_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "paternal_surname"
    t.string "maternal_surname"
    t.string "email"
    t.string "curp"
    t.string "clave"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido_paterno"
    t.string "apellido_materno"
    t.string "correo_electronico"
    t.string "area_adscripcion"
    t.string "grado_academico"
    t.string "abreviatura_grado_academica"
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
  add_foreign_key "courses", "asignaturas"
  add_foreign_key "courses", "periods"
  add_foreign_key "courses", "teachers"
  add_foreign_key "cursos", "asignaturas"
  add_foreign_key "cursos", "periodos"
  add_foreign_key "cursos", "profesors"
  add_foreign_key "inscriptions", "courses"
  add_foreign_key "inscriptions", "periods"
  add_foreign_key "inscriptions", "students"
  add_foreign_key "plan_estudios", "carreras"
  add_foreign_key "records", "alumnos"
  add_foreign_key "records", "periodos"
  add_foreign_key "records", "plan_estudios"
  add_foreign_key "records", "semesters"
  add_foreign_key "statutes", "carreras"
end
