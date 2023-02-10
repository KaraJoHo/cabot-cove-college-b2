require 'rails_helper'

RSpec.describe Resident, type: :model do
  let!(:jessica) {Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")} 
  let!(:seth) {Resident.create!(name: "Seth Guy", age: 70, occupation: "Retired")}
  let!(:course_1) {Course.create!(name: "Crime Scenes 101")}
  let!(:course_2) {Course.create!(name: "Fingerprinting")}
  let!(:rescourse_1) {ResidentCourse.create!(resident_id: jessica.id, course_id: course_1.id)}
  let!(:rescourse_2) {ResidentCourse.create!(resident_id: jessica.id, course_id: course_2.id)}

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end

  describe '#courses_list' do 
    it 'has all the courses of the resident' do 
      expect(jessica.courses_list).to eq([course_1, course_2])
    end
  end

  describe '::average_age' do 
    it 'is the average age of all residents' do 
     expect(Resident.average_age).to eq(67.5)
    end
  end

  describe '::sort_alpha' do 
    it 'sorts the residents alphabetically' do 
      expect(Resident.sort_alpha).to eq([jessica, seth])
    end
  end

end
