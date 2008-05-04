require File.dirname(__FILE__) + '/../spec_helper'

describe Student do

  before(:each) do
    @student_with_email_only = Student.new({:email=> "my_name@domain.com"})
    @student_with_login_only = Student.new({:login=> "my_name"})
  end
  
  it "should be invalid without login" do
    @student_with_email_only.should_not be_valid
  end
  
  it "should be invalid without email" do
    @student_with_login_only.should_not be_valid
  end

end
