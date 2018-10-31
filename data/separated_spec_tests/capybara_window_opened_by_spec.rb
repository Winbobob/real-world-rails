# frozen_string_literal: true

Capybara::SpecHelper.spec '#window_opened_by', requires: [:windows] do
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

  let(:zero_windows_message) { "block passed to #window_opened_by opened 0 windows instead of 1" }
  let(:two_windows_message) { "block passed to #window_opened_by opened 2 windows instead of 1" }

  context 'with :wait option' do
    it 'should raise error if value of :wait is less than timeout' 


    it 'should find window if value of :wait is more than timeout' 

  end

  context 'without :wait option' do
    it 'should raise error if default_max_wait_time is less than timeout' 


    it 'should find window if default_max_wait_time is more than timeout' 

  end

  it 'should raise error when two windows have been opened by block' 


  it 'should raise error when no windows were opened by block' 

end

