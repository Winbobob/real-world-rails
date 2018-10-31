# frozen_string_literal: true

Capybara::SpecHelper.spec '#switch_to_frame', requires: [:frames] do
  before do
    @session.visit('/within_frames')
  end

  after do
    # Ensure we clean up after the frame changes
    @session.switch_to_frame(:top)
  end

  it "should find the div in frameOne" 


  it "should find the div in FrameTwo" 


  it "should return to the parent frame when told to" 


  it "should be able to switch to nested frames" 


  it "should reset scope when changing frames" 


  it "works if the frame is closed", requires: %i[frames js] do
    frame = @session.find(:frame, 'parentFrame')
    @session.switch_to_frame frame
    frame = @session.find(:frame, 'childFrame')
    @session.switch_to_frame frame

    @session.click_link 'Close Window'
    @session.switch_to_frame :parent # Go back to parentFrame
    expect(@session).to have_selector(:css, 'body#parentBody')
    expect(@session).not_to have_selector(:css, '#childFrame')
    @session.switch_to_frame :parent # Go back to top
  end

  it "can return to the top frame", requires: [:frames] do
    frame = @session.find(:frame, "parentFrame")
    @session.switch_to_frame frame
    frame = @session.find(:frame, "childFrame")
    @session.switch_to_frame frame
    @session.switch_to_frame :top
    expect(@session.find("//*[@id='divInMainWindow']").text).to eql 'This is the text for divInMainWindow'
  end

  it "should raise error if switching to parent unmatched inside `within` as it's nonsense" 


  it "should raise error if switching to top inside a `within` in a frame as it's nonsense" 


  it "should raise error if switching to top inside a nested `within` in a frame as it's nonsense" 

end

