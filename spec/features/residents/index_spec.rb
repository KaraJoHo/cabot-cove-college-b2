require 'rails_helper'

RSpec.describe 'Resident Index' do 
  # before(:each) do 
  #   jessica = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
  #   seth = Resident.create!(name: "Seth Hazlitt", age:70, occupation: "Town Doctor")
  # end
  let!(:jessica) {Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")}
  let!(:seth) {Resident.create!(name: "Seth Hazlitt", age:70, occupation: "Town Doctor")}
  describe 'as a visitor' do 
    describe 'when I visit /residents' do 
      it 'has a list of resident with their information' do 
        visit '/residents' 

        expect(page).to have_content(jessica.name)
        expect(page).to have_content(jessica.age)
        expect(page).to have_content(jessica.occupation)
        expect(page).to have_content(seth.name)
        expect(page).to have_content(seth.age)
        expect(page).to have_content(seth.occupation)

      end
    end
  end
end