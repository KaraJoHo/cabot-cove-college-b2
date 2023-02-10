require 'rails_helper'

RSpec.describe Course, type: :model do
  let!(:seth) {Resident.create!(name: "Seth Guy", age:70, occupation: "Retired")}
  let!(:jessica) {Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")} 

  let!(:course_1) {Course.create!(name: "Crime Scenes 101")}
  let!(:course_2) {Course.create!(name: "Fingerprinting")}

  let!(:rescourse_1) {ResidentCourse.create!(resident_id: jessica.id, course_id: course_1.id)}
  let!(:rescourse_2) {ResidentCourse.create!(resident_id: jessica.id, course_id: course_2.id)}
  let!(:rescourse_3) {ResidentCourse.create!(resident_id: seth.id, course_id: course_2.id)}

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:residents).through(:resident_courses)}
  end

  describe 'number_residents_per_course' do 
    it 'has the number of residents in each course' do 
      expect(course_1.number_residents_per_course).to eq(1)
      expect(course_2.number_residents_per_course).to eq(2)
    end
  end

  describe '::sort_alpha' do 
    it 'sorts coures alphabetically' do 
      expect(Course.sort_alpha).to eq([course_1, course_2])
    end
  end

end
