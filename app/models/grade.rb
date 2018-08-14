class Grade < ApplicationRecord
  belongs_to :alumno
  belongs_to :periodo
  belongs_to :record
  belongs_to :curso
end
