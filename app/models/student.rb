class Student < ApplicationRecord
  validates_presence_of :name

  has_many :student_grades
  has_many :courses, through: :student_grades
end
