# frozen_string_literal: true

Capybara::SpecHelper.spec '#current_window', requires: [:windows] do
  before do
    @window = @session.current_window
    @session.visit('/with_windows')
  end

  after do
    (@session.windows - [@window]).each do |w|
      @session.switch_to_window w
      w.close
    end
    @session.switch_to_window(@window)
  end

  it 'should return window' 


  it 'should be modified by switching to another window' 

end

