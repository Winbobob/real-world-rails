# frozen_string_literal: true

Capybara::SpecHelper.spec '#windows', requires: [:windows] do
  before do
    @window = @session.current_window
    @session.visit('/with_windows')
    @session.find(:css, '#openTwoWindows').click

    @session.document.synchronize(3, errors: [Capybara::CapybaraError]) do
      raise Capybara::CapybaraError if @session.windows.size != 3
    end
  end
  after do
    (@session.windows - [@window]).each do |w|
      @session.switch_to_window w
      w.close
    end
    @session.switch_to_window(@window)
  end

  it 'should return objects of Capybara::Window class' 


  it 'should switchable windows' 

end

