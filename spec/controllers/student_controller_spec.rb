require File.dirname(__FILE__) + '/../spec_helper'

describe StudentsController, "#route_for" do
  
  it "should map { :controller => 'students', :action => 'new' } to /signup" do
    route_for(:controller => "students", :action => "new").should == "/signup"
  end

  it "should map { :controller => 'students', :action => 'create' } to /students" do
    route_for(:controller => "students", :action => "create").should == "/students"
  end
  
end

describe StudentsController, "handling GET /signup (/students/new)" do
  before do
    @student = mock_model(Student)
    Student.stub!(:new).and_return(@student)
  end

  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should create a new student" do
    Student.should_receive(:new).with(no_args()).and_return(@student)
    do_get
  end  
  
end