# frozen_string_literal: true

Capybara::SpecHelper.spec '#within_window', requires: [:windows] do
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

  context "with an instance of Capybara::Window" do
    it "should not invoke driver#switch_to_window when given current window" 


    it "should be able to switch to another window" 


    it "returns value from the block" 


    it "should switch back if exception was raised inside block" 


    it "should leave correct scopes after execution in case of error", requires: %i[windows frames] do
      window = (@session.windows - [@window]).first
      expect do
        @session.within_frame 'frameOne' do
          @session.within_window(window) {}
        end
      end.to raise_error(Capybara::ScopeError)
      expect(@session.current_window).to eq(@window)
      expect(@session).to have_css('#doesNotOpenWindows')
      expect(@session.send(:scopes)).to eq([nil])
    end

    it 'should raise error if closed window was passed' 

  end

  context "with lambda" do
    it "should find the div in another window" 


    it "should find divs in both windows" 


    it "should be able to nest within_window" 


    it "should work inside a normal scope" 


    it "should raise error if window wasn't found" 


    it "returns value from the block" 


    it "should switch back if exception was raised inside block" 

  end
end

