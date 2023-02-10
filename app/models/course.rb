class Course < ApplicationRecord
  validates_presence_of :name

  has_many :resident_courses
  has_many :residents, through: :resident_courses

  def number_residents_per_course 
    residents.count
  end

  def self.sort_alpha 
    Course.order(:name)
  end


end
