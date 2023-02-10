class Resident < ApplicationRecord
  validates_presence_of :name, :age, :occupation
  has_many :resident_courses 
  has_many :courses, through: :resident_courses

  def courses_list 
    courses
  end

  def self.average_age 
    Resident.average(:age).to_f
  end

  def self.sort_alpha 
    Resident.order(:name)
  end

end
