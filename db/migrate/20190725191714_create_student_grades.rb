class CreateStudentGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :student_grades do |t|
      t.float :grade
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
    end
  end
end
