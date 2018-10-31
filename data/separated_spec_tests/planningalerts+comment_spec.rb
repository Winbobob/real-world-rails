require 'spec_helper'

describe "comments/_comment" do
  before do
    Timecop.freeze(Time.local(2015, 1, 26, 10, 5, 0))
  end

  let(:application) { VCR.use_cassette('planningalerts') { create(:application) } }

  after do
    Timecop.return
  end

  it "should add rel='no-follow' to links in the comment text" 


  it "should format simple text in separate paragraphs with p tags" 


  it "should get rid of nasty javascript and strip out images" 

end

