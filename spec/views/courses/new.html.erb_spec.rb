require File.dirname(__FILE__) + '/../../spec_helper'

describe "/courses/new.html.erb" do

  before do
    @course = mock_model(Course, :title => 'een titel', :description => 'een beschrijving')
    @course.stub!(:new_record?).and_return(true)    
    assigns[:course] = @course
  end

  it "should render new form" do
    render "/courses/new.html.erb"
    response.should have_tag("form[action=?][method='post']", "/courses") do
      with_tag("input#course_title[name=?]", "course[title]")
      with_tag("textarea#course_description[name=?]", "course[description]")
      with_tag("input[type=submit]")
    end
  end  
  
end