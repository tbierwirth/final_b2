require 'rails_helper'

RSpec.describe 'As a User' do
  before :each do
    @tyler = Student.create(name: "Tyler B")
    @bob = Student.create(name: "Bob Bert")
    @calculus = Course.create(name: "Calculus")
    @biology = Course.create(name: "Biology")
    @history = Course.create(name: "History")
    @tyler.student_grades.create(course: @calculus, grade: 3.0)
    @tyler.student_grades.create(course: @biology, grade: 4.0)
    @tyler.student_grades.create(course: @history, grade: 2.5)
    @bob.student_grades.create(course: @calculus, grade: 2.5)
    @bob.student_grades.create(course: @biology, grade: 2.0)
    @bob.student_grades.create(course: @history, grade: 3.0)
  end

  it "when I visit a students show page" do
    visit student_show_path(@tyler)

    within "#student-#{@tyler.id}" do
      expect(page).to have_content(@tyler.name)
      expect(page).to have_content(@calculus.name)
      expect(page).to have_content(@biology.name)
      expect(page).to have_content(@history.name)
      expect(page).to have_content(@tyler.student_grades.select("grade").where(course_id: @calculus).first.grade)
      expect(page).to have_content(@tyler.student_grades.select("grade").where(course_id: @biology).first.grade)
      expect(page).to have_content(@tyler.student_grades.select("grade").where(course_id: @history).first.grade)
    end

  end
end
