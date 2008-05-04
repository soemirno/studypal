class StudentController < ApplicationController
  
  def signup
    @student = Student.signup(params[:student])
    if @student.valid?
      redirect_to :action => "show"
    else
      render :action => "new"
    end
  end

end