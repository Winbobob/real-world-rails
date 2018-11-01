# frozen_string_literal: true

# Note: This file uses `sleep` to sync up parts of the tests. This is only implemented like this
# because of the methods being tested. In tests using Capybara this type of behavior should be implemented
# using Capybara provided assertions with builtin waiting behavior.

Capybara::SpecHelper.spec '#switch_to_window', requires: [:windows] do
  before do
    @window = @session.current_window
    @session.visit('/with_windows')
    @session.assert_selector(:css, 'body.loaded')
  end

  after do
    (@session.windows - [@window]).each do |w|
      @session.switch_to_window w
      w.close
    end
    @session.switch_to_window(@window)
  end

  it 'should raise error when invoked without args' 


  it 'should raise error when invoked with window and block' 


  context 'with an instance of Capybara::Window' do
    it 'should be able to switch to window' 


    it 'should raise error when closed window is passed' 

  end

  context 'with block' do
    before do
      @session.find(:css, '#openTwoWindows').click
      sleep(1) # wait for the windows to open
    end

    it 'should be able to switch to current window' 


    it 'should find the div in another window' 


    it 'should be able to switch multiple times' 


    it 'should return window' 


    it "should raise error when invoked inside `within` as it's nonsense" 


    it "should raise error when invoked inside `within_frame` as it's nonsense" 


    it 'should allow to be called inside within_window and within_window will still return to original' 


    it "should raise error if window matching block wasn't found" 


    it 'should switch to original window if error is raised inside block' 

  end

  it 'should wait for window to appear' 

end

