class Record < ApplicationRecord
  belongs_to :alumno
  belongs_to :periodo
  belongs_to :plan_estudio
  belongs_to :semester

  has_and_belongs_to_many :cursos
end
