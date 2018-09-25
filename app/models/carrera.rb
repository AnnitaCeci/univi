class Carrera < ApplicationRecord
	has_many :plan_estudios

  validates :clave, presence: true
  validates :nombre, presence: true

  validates :nombre, uniqueness: {scope: :clave, message: " del Programa de Estudios y la Clave deben ser únicos."}
end
