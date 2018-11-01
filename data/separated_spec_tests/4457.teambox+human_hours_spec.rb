require 'spec_helper'

describe ApplicationHelper, "#human_hours" do

  it "ignores zero" 


  it "gets hours" 


  it "outs hours and minutes" 


  it "handles 1/3" 


  it "removes incomplete minutes" 


  it "rounds up complete minutes" 

  
  it "rounds up correctly" 

  
  it "rounds down zero" 

  
  def result(hours)
    helper.human_hours(hours)
  end

end

