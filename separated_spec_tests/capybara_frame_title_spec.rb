# frozen_string_literal: true

Capybara::SpecHelper.spec '#frame_title', requires: [:frames] do
  before do
    @session.visit('/within_frames')
  end

  it "should return the title in a frame" 


  it "should return the title in FrameTwo" 


  it "should return the title in the main frame" 

end

