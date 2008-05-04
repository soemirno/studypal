require File.dirname(__FILE__) + '/../spec_helper'

describe StudentController, "handling signup" do

  # Student stub
  class Student; end

  before(:each) do
    @params = {"key" => "value", "other_key" => "other value"}
    @valid_student = mock("Valid Student", :valid? => true)
    @invalid_student = mock("Invalid Student", :valid? => false)
    Student.stub!(:signup).and_return(@valid_student)
  end
  
  def signup
    post :signup, :student => @params
  end
      
  it "should let new student signup" do
    Student.should_receive(:signup).with(@params).and_return(@valid_student)
    signup
  end
  
  it "should keep reference to signed up student" do
    signup
    assigns[:student].should == @valid_student
  end
  
  it "should redirect if succesfull" do
    signup
    response.should redirect_to(:action => 'show')
  end
  
  it "should re-render new if failed" do
    Student.stub!(:signup).and_return(@invalid_student)
    signup
    response.should render_template('new')
  end
  
end