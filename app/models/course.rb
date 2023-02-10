class Course < ApplicationRecord
  validates_presence_of :name

  has_many :resident_courses
  has_many :residents, through: :resident_courses

  def number_residents_per_course 
    residents.count
  end

end
