require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "Relationships" do
    it {should have_many :student_grades}
    it {should have_many(:courses).through(:student_grades)}
  end
end
