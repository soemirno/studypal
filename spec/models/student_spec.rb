require File.dirname(__FILE__) + '/../spec_helper'

describe Student do
  before(:each) do
    @student = Student.new :login => "Albert", :identity_url => "http://myopenid/url" , :email => "albert@someplace.com"
  end

  it "should have a login name" do
    @student.login.should == "Albert"
  end  
  
  it "should have an identity_url" do
    @student.identity_url.should == "http://myopenid/url"
  end  
  

  it "should have an email address" do
    @student.email.should == "albert@someplace.com"
  end
  
end
