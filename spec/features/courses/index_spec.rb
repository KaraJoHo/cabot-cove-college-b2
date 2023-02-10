require 'rails_helper'

RSpec.describe "Courses Index Page" do
  let!(:seth) {Resident.create!(name: "Seth Guy", age:70, occupation: "Retired")}
  let!(:jessica) {Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")} 

  let!(:course_1) {Course.create!(name: "Crime Scenes 101")}
  let!(:course_2) {Course.create!(name: "Fingerprinting")}

  let!(:rescourse_1) {ResidentCourse.create!(resident_id: jessica.id, course_id: course_1.id)}
  let!(:rescourse_2) {ResidentCourse.create!(resident_id: jessica.id, course_id: course_2.id)}
  let!(:rescourse_3) {ResidentCourse.create!(resident_id: seth.id, course_id: course_2.id)}

  describe 'As a visitor' do 
    describe 'When I visit /courses' do 
      it' has a list of courses and the number of residents enrolled in each' do 
        visit '/courses' 
        expect(page).to have_content(course_1.name)
        expect(page).to have_content(course_2.name)
        expect(page).to have_content("#{course_1.name}: 1")
        expect(page).to have_content("#{course_2.name}: 2")
      end
    end
  end
end