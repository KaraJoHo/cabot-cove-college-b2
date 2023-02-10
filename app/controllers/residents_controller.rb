class ResidentsController < ApplicationController 
  def index 
    @residents = Resident.all
    @avg_age = Resident.average_age
  end

  def show 
    @resident = Resident.find(params[:id])
    @resident_courses = @resident.courses_list

  end

end