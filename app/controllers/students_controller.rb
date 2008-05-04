class StudentsController < ApplicationController
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.create(params[:student])
    if @student.valid?
      redirect_to :action => "show"
    else
      render :action => "new"
    end
  end

end