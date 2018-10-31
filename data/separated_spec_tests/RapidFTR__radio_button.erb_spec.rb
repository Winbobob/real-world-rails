require 'spec_helper'

describe 'shared/_radio_button.html.erb', :type => :view do
  before :each do
    @child = Child.new('_id' => 'id12345', 'name' => 'First Last', 'new field' => 'radio button group name')
    assigns[:child] = @child
  end

  it 'should include image for tooltip when help text exists' 


  it 'should not include image for tooltip when help text not exists' 


end

