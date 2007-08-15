require File.dirname(__FILE__) + '/../../spec_helper'

describe "/students/new" do
  before do
    @student = mock_model(Student)
    @student.stub!(:new_record?).and_return(true)
    @student.stub!(:login)
    @student.stub!(:password)
    @student.stub!(:password_confirmation)
    @student.stub!(:email)
    assigns[:student] = @student
    render '/students/new'
  end
  
  it "should render student entry form" do
    response.should have_tag("form[action=?][method=post]", students_path) do
      with_tag("input#student_submit[name='commit'][type='submit'][value='Signup']","","should have a submit button")

      with_tag("input#student_login[name=?][type='text']","student[login]","","should have a login name entry field")            
      with_tag("label[for='student_login']","Login:","should have a login name label")  
      
      with_tag("input#student_password[name=?][type='password']","student[password]","","should have a password entry field")
      with_tag("label[for='student_password']","Password:","should have a password label")

      with_tag("input#student_password_confirmation[name=?][type='password']","student[password_confirmation]","","should have a password_confirmation entry field")
      with_tag("label[for='student_password_confirmation']","Confirm Password:","should have a password confirmation label")
      
      with_tag("input#student_email[name=?][type='text']","student[email]","","should have an email entry field")
      with_tag("label[for='student_email']","Email:","should have an email label")  
    end
  end  

end
