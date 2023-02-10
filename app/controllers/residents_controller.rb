class ResidentsController < ApplicationController 
  def index 
    @residents = Resident.sort_alpha
    @avg_age = Resident.average_age
  end

  def show 
    @resident = Resident.find(params[:id])
    @resident_courses = @resident.courses_list

  end

end