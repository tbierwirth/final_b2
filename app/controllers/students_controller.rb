class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @courses = @student.course_grades
  end
end
