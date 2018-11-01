# frozen_string_literal: true

Capybara::SpecHelper.spec '#within_frame', requires: [:frames] do
  before do
    @session.visit('/within_frames')
  end

  it 'should find the div in frameOne' 


  it 'should find the div in FrameTwo' 


  it 'should find the text div in the main window after finding text in frameOne' 


  it 'should find the text div in the main window after finding text in frameTwo' 


  it 'should return the result of executing the block' 


  it 'should find the div given Element' 


  it 'should find the div given selector and locator' 


  it 'should default to the :frame selector kind when only options passed' 


  it 'should default to the :frame selector when no options passed' 


  it 'should find multiple nested frames' 


  it 'should reset scope when changing frames' 


  it 'works if the frame is closed', requires: %i[frames js] do
    @session.within_frame 'parentFrame' do
      @session.within_frame 'childFrame' do
        @session.click_link 'Close Window'
      end
      expect(@session).to have_selector(:css, 'body#parentBody')
      expect(@session).not_to have_selector(:css, '#childFrame')
    end
  end
end

