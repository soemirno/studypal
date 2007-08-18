require File.dirname(__FILE__) + '/../spec_helper'

describe Student do
  before(:each) do
    @student = Student.new
  end

  it "should have a login name" do
    @student.login.should be_nil
  end  
  
  it "should have an identity_url" do
    @student.identity_url.should be_nil
  end  
  

  it "should have an email address" do
    @student.email.should be_nil
  end
  
end
