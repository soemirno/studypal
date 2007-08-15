class StudentsController < ApplicationController

  def new
    @student = Student.new
  end
  
end
