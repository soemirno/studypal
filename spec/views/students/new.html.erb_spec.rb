require File.dirname(__FILE__) + '/../../spec_helper'

describe "/students/new.html.erb" do

  before do
    @student = mock_model(Student, :login => nil, :email => nil, :password => nil, :password_confirmation => nil)
    @student.stub!(:new_record?).and_return(true) 
    assigns[:student] = @student
  end

  it "should render form with student signup input fields" do
    render "/students/new.html.erb"
    response.should have_tag("form[action=?][method='post']", "/students") do
      with_tag("input#student_login[name=?]", "student[login]")
      with_tag("input#student_email[name=?]", "student[email]")
      with_tag("input#student_password[name=?]", "student[password]")
      with_tag("input#student_password_confirmation[name=?]", "student[password_confirmation]")
    end
  end  
  
end