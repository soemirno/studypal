require File.dirname(__FILE__) + '/../spec_helper'

describe StudentsController, "#route_for" do
  
  it "should map { :controller => 'students', :action => 'new' } to /signup" do
    route_for(:controller => "students", :action => "new").should == "/signup"
  end
  
end