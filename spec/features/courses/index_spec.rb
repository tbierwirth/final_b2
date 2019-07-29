require 'rails_helper'

RSpec.describe 'As a User' do
  before :each do
    @tyler = Student.create(name: "Tyler B")
    @bob = Student.create(name: "Bob Bert")
    @steve = Student.create(name: "Steve Beans")
    @calculus = Course.create(name: "Calculus")
    @biology = Course.create(name: "Biology")
    @history = Course.create(name: "History")
    @tyler.student_grades.create(course: @calculus, grade: 3.0)
    @tyler.student_grades.create(course: @biology, grade: 4.0)
    @tyler.student_grades.create(course: @history, grade: 2.5)
    @bob.student_grades.create(course: @calculus, grade: 2.5)
    @bob.student_grades.create(course: @biology, grade: 2.0)
    @bob.student_grades.create(course: @history, grade: 3.0)
    @steve.student_grades.create(course: @calculus, grade: 1.0)
    @steve.student_grades.create(course: @biology, grade: 1.0)
    @steve.student_grades.create(course: @history, grade: 2.0)
  end

  it "When I visit the course index page I see each course in the system and grades" do
    visit courses_path

    within "#course-#{@calculus.id}" do
      expect(page).to have_content(@calculus.name)
      expect(page.all('li')[0]).to have_content(@tyler.name)
      expect(page.all('li')[2]).to have_content(@bob.name)
      expect(page.all('li')[4]).to have_content(@steve.name)
    end

    within "#course-#{@biology.id}" do
      expect(page).to have_content(@biology.name)
      expect(page.all('li')[0]).to have_content(@tyler.name)
      expect(page.all('li')[2]).to have_content(@bob.name)
      expect(page.all('li')[4]).to have_content(@steve.name)
    end

    within "#course-#{@history.id}" do
      expect(page).to have_content(@history.name)
      expect(page.all('li')[0]).to have_content(@bob.name)
      expect(page.all('li')[2]).to have_content(@tyler.name)
      expect(page.all('li')[4]).to have_content(@steve.name)
    end
  end

end
