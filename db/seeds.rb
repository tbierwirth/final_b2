# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
