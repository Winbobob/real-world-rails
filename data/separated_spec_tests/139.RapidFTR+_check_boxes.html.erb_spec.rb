require 'spec_helper'

describe 'children/_check_boxes.html.erb', :type => :view do
  before :each do
    @child = Child.new('_id' => 'id12345', 'name' => 'First Last', 'new field' => 'Yes')
    assigns[:child] = @child
  end

  it 'should include image for tooltip when help text exists' 


  it 'should not include image for tooltip when help text does not exist' 


end

