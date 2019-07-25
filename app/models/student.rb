class Student < ApplicationRecord
  validates_presence_of :name

  has_many :student_grades
  has_many :courses, through: :student_grades

  def course_grades
    Student.select('courses.id', 'courses.name', 'student_grades.grade').joins(:courses).where(id: self.id)
    # courses.select(:id, :name, 'student_grades.grade', 'student_grades.student_id').joins(:student_grades)
    # student_grades.select(:grade, 'courses.name', 'courses.grade').joins(:courses).where(student_id: self.id)
  end
end
