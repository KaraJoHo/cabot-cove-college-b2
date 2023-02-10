class Resident < ApplicationRecord
  validates_presence_of :name, :age, :occupation
  has_many :resident_courses 
  has_many :courses, through: :resident_courses

  def courses_list 
    courses
  end

end
