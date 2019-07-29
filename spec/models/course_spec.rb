require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Relationships" do
    it {should have_many :student_grades}
    it {should have_many(:students).through(:student_grades)}
  end

  describe "Class Methods" do
    before :each do
      @calculus = Course.create(name: "Calculus")
      @tyler = Student.create(name: "Tyler B")
      @bob = Student.create(name: "Bob Bert")
      @steve = Student.create(name: "Steve Beans")
      @tyler.student_grades.create(course: @calculus, grade: 3.0)
      @bob.student_grades.create(course: @calculus, grade: 2.5)
      @steve.student_grades.create(course: @calculus, grade: 1.0)
    end

    it '.sorted_by_grade' do
      students = @calculus.sorted_by_grade
      sorted = students.map do |student|
        student.name
      end
      expect(sorted).to eq([@tyler.name, @bob.name, @steve.name])
    end

  end
end
