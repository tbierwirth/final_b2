require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "Relationships" do
    it {should have_many :student_grades}
    it {should have_many(:courses).through(:student_grades)}
  end

  describe "Class Methods" do
    before :each do
      @tyler = Student.create(name: "Tyler B")
      @calculus = Course.create(name: "Calculus")
      @biology = Course.create(name: "Biology")
      @history = Course.create(name: "History")
      @tyler.student_grades.create(course: @calculus, grade: 3.0)
      @tyler.student_grades.create(course: @biology, grade: 4.0)
      @tyler.student_grades.create(course: @history, grade: 2.5)
    end

    it '.course_grades' do
      courses = @tyler.course_grades.map do |course|
        course.name
      end

      grades = @tyler.course_grades.map do |course|
        course.grade
      end
        expect(courses).to eq([@calculus.name, @biology.name, @history.name])
        expect(grades).to eq([3.0, 4.0, 2.5])
      end
    end
end
