require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Relationships" do
    it {should have_many :student_grades}
    it {should have_many(:students).through(:student_grades)}
  end
end
