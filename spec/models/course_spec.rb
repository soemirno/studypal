require File.dirname(__FILE__) + '/../spec_helper'

describe Course do
  fixtures :courses

  before(:each) do
    @course = courses(:one)
  end

  it "should have title" do
    @course.title.should == "MyTitle"
  end
  
  it "should have description" do
    @course.description.should == "MyDescription"
  end
end
