class Semester < ApplicationRecord


  validates :clave, presence: true, uniqueness: true
  validates :nombre, presence: true, uniqueness: true

  validates :nombre, uniqueness: {scope: :clave, message: " del Semestre y la Clave deben ser únicos."}
end
