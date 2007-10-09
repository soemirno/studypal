require File.dirname(__FILE__) + '/../spec_helper'


describe CoursesController, "#route_for" do
  
  it "should map { :controller => 'courses', :action => 'new' } to /courses/new" do
    route_for(:controller => "courses", :action => "new").should == "/courses/new"
  end
  
end

describe CoursesController, "handling GET /courses/new"  do

    before do
      @course = mock_model(Course)
      Course.stub!(:new).and_return(@course)
    end

    def do_get
      get :new
    end
    
    it "should be succesful" do
      do_get
      response.should be_success      
    end
    
    it "should create new course and should assign it for the view" do
      Course.should_receive(:new).and_return(@course)
      do_get
      assigns[:course].should == @course
    end
    
    it "should render template new" do
      do_get
      response.should render_template('new')      
    end
    
end

describe CoursesController, "handling POST /courses" do
  before do
    @course = mock_model(Course)
    Course.stub!(:new).and_return(@course)
    @course.stub!(:save).and_return(true)
    @params = {}
  end
  
  def post_with_successful_save    
    post :create, :course => @params
  end  
  
  it "should create a new course" do
    Course.should_receive(:new).with(@params).and_return(@course)
    post_with_successful_save
  end
  
  it "should save new course" do
    @course.should_receive(:save).and_return(true)
    post_with_successful_save
  end
  
  
end