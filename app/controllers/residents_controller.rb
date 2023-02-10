class ResidentsController < ApplicationController 
  def index 
    @residents = Resident.all
  end

  def show 
    @resident = Resident.find(params[:id])
    @resident_courses = @resident.courses
  end

end