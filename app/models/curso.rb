class Curso < ApplicationRecord
  belongs_to :asignatura
  belongs_to :periodo
  belongs_to :profesor

  has_and_belongs_to_many :records
end
