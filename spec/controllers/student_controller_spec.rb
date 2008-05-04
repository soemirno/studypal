require File.dirname(__FILE__) + '/../spec_helper'

describe StudentController, "handling new student" do

  # Student stub
  class Student; end
  
  before do
    @student = mock("Student")
    Student.stub!(:new).and_return(@student)
  end

  def do_get
    get :new
  end
    
  it "should create new student placeholder" do
    Student.should_receive(:new).and_return(@student)
    do_get
  end
  
  it "should keep reference to new student placeholder" do
    do_get
    assigns[:student].should == @student
  end
  
  it "should render template new" do
    do_get
    response.should render_template('new')      
  end
  
end

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
  
  it "should redirect if succesful" do
    signup
    response.should redirect_to(:action => 'show')
  end
  
  it "should re-render new if failed" do
    Student.stub!(:signup).and_return(@invalid_student)
    signup
    response.should render_template('new')
  end
  
end