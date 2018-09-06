# frozen_string_literal: true

Capybara::SpecHelper.spec '#frame_url', requires: [:frames] do
  before do
    @session.visit('/within_frames')
  end

  it "should return the url in a frame" 


  it "should return the url in FrameTwo" 


  it "should return the url in the main frame" 

end

