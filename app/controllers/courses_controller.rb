class CoursesController < ApplicationController
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(params[:course])
    @course.save
  end
end
