require 'spec_helper'

describe ApplicationHelper, '#dynamic_link_to' do
  it "appends an image icon to an external link" 


  it "does not append an image icon to an internal link" 

end

describe ApplicationHelper, '#ext_link_to' do
  it "appends an image icon to the link" 

end

describe ApplicationHelper, '#icon' do
  before :each do
    @flag_content = 'flag content'
  end

  it "returns correct markup when given a block" 


  it "returns correct markup when given a content string" 


  it "merges class attributes correctly" 

end

describe ApplicationHelper, '#tx' do
  before :each do
    @test_text = 'test'
    @test_key = 'text'
    EXTERNAL_STRINGS['test_action'] = { @test_key => @test_text }
    params = { 'action' => 'test_action' }
    allow(helper).to receive( :params ).and_return( params )
  end

  it "should lookup the correct hash value based on action and key" 


  it "should return an html_safe string (unescaped)" 

end

describe ApplicationHelper, '#to' do
  before :each do
    @test_obj = [ 1, 2 ,3 ]
    @test_key = 'text'
    EXTERNAL_STRINGS['test_action'] = { @test_key => @test_obj }
    params = { 'action' => 'test_action' }
    allow(helper).to receive( :params ).and_return( params )
  end

  it "should lookup the correct hash value based on action and key" 

end

describe ApplicationHelper, '#label' do
  it 'should create a span with <label-given_class> and label as the classes' 


  it 'should create html safe content' 

end

