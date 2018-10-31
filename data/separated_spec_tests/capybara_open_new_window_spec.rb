# frozen_string_literal: true

Capybara::SpecHelper.spec '#open_new_window', requires: [:windows] do
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

  it 'should open new window with blank url and title' 


  it 'should open window with changeable content' 

end

