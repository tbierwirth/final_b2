class Course < ApplicationRecord
  validates_presence_of :name

  has_many :student_grades
  has_many :students, through: :student_grades

  def sorted_by_grade
    student_grades.select(:grade, 'students.name')
                  .joins(:student)
                  .order('grade DESC')
  end
end
