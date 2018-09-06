# frozen_string_literal: true

Capybara::SpecHelper.spec '#become_closed', requires: %i[windows js] do
  before do
    @window = @session.current_window
    @session.visit('/with_windows')
    @other_window = @session.window_opened_by do
      @session.find(:css, '#openWindow').click
    end
  end

  after do
    @session.document.synchronize(5, errors: [Capybara::CapybaraError]) do
      raise Capybara::CapybaraError if @session.windows.size != 1
    end
    @session.switch_to_window(@window)
  end

  context 'with :wait option' do
    it 'should wait if value of :wait is more than timeout' 


    it 'should raise error if value of :wait is less than timeout' 

  end

  context 'without :wait option' do
    it 'should wait if value of default_max_wait_time is more than timeout' 


    it 'should raise error if value of default_max_wait_time is less than timeout' 

  end

  context 'with not_to' do
    it "should not raise error if window doesn't close before default_max_wait_time" 


    it 'should raise error if window closes before default_max_wait_time' 

  end
end

