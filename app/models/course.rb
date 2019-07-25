class Course < ApplicationRecord
  validates_presence_of :name
  
  has_many :student_grades
  has_many :students, through: :student_grades
end
