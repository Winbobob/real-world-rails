require 'spec_helper'

describe 'shared/_text_field.html.erb', :type => :view do
  before :each do
    @child = Child.new('_id' => 'id12345', 'name' => 'First Last')
    assigns[:child] = @child
  end

  it 'should include image for tooltip when help text exists' 


  it 'should not include image for tooltip when help text not exists' 


end

