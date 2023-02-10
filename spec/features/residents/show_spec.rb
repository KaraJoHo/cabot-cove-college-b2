require 'rails_helper'

RSpec.describe "Resident Show Page" do 
  let!(:jessica) {Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")} 
  let!(:course_1) {Course.create!(name: "Crime Scenes 101")}
  let!(:course_2) {Course.create!(name: "Fingerprinting")}
  let!(:rescourse_1) {ResidentCourse.create!(resident_id: jessica.id, course_id: course_1.id)}
  let!(:rescourse_2) {ResidentCourse.create!(resident_id: jessica.id, course_id: course_2.id)}

  describe 'As a visitor' do 
    describe 'When I visit /residents/:id' do 
      it 'has a list of that residents courses' do 
        visit "/residents/#{jessica.id}"

        expect(page).to have_content(course_1.name)
        expect(page).to have_content(course_2.name)
      end
    end
  end
end