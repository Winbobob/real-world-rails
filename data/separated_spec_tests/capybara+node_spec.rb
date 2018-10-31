# frozen_string_literal: true

# Note: This file uses `sleep` to sync up parts of the tests. This is only implemented like this
# because of the methods being tested. In tests using Capybara this type of behavior should be implemented
# using Capybara provided assertions with builtin waiting behavior.

Capybara::SpecHelper.spec 'node' do
  before do
    @session.visit('/with_html')
  end

  it 'should act like a session object' 


  it 'should scope CSS selectors' 


  describe '#query_scope' do
    it 'should have a reference to the element the query was evaluated on if there is one' 

  end

  describe '#text' do
    it 'should extract node texts' 


    it 'should return document text on /html selector' 

  end

  describe '#[]' do
    it 'should extract node attributes' 


    it 'should extract boolean node attributes' 

  end

  describe '#style', requires: [:css] do
    it 'should return the computed style value' 


    it 'should return multiple style values' 

  end

  describe '#value' do
    it 'should allow retrieval of the value' 


    it 'should not swallow extra newlines in textarea' 


    it 'should not swallow leading newlines for set content in textarea' 


    it 'return any HTML content in textarea' 


    it "defaults to 'on' for checkbox" 


    it "defaults to 'on' for radio buttons" 

  end

  describe '#set' do
    it 'should allow assignment of field value' 


    it 'should fill the field even if the caret was not at the end', requires: [:js] do
      @session.execute_script("var el = document.getElementById('test_field'); el.focus(); el.setSelectionRange(0, 0);")
      @session.first('//input').set('')
      expect(@session.first('//input').value).to eq('')
    end

    it 'should raise if the text field is readonly' 


    it 'should raise if the textarea is readonly' 


    it 'should use global default options' 


    context 'with a contenteditable element', requires: [:js] do
      it 'should allow me to change the contents' 


      it 'should allow me to set the contents' 


      it 'should allow me to change the contents of a child element' 

    end
  end

  describe '#tag_name' do
    it 'should extract node tag name' 

  end

  describe '#disabled?' do
    it 'should extract disabled node' 


    it 'should see disabled options as disabled' 


    it 'should see enabled options in disabled select as disabled' 


    it 'should see enabled options in disabled optgroup as disabled' 


    it 'should see a disabled fieldset as disabled' 


    context 'in a disabled fieldset' do
      # https://html.spec.whatwg.org/#the-fieldset-element
      it 'should see elements not in first legend as disabled' 


      it 'should see elements in first legend as enabled' 


      it 'should sees options not in first legend as disabled' 

    end

    it 'should be boolean' 


    it 'should be disabled for all elements that are CSS :disabled' 

  end

  describe '#visible?' do
    it 'should extract node visibility' 


    it 'should be boolean' 

  end

  describe '#checked?' do
    it 'should extract node checked state' 


    it 'should be boolean' 

  end

  describe '#selected?' do
    it 'should extract node selected state' 


    it 'should be boolean' 

  end

  describe '#==' do
    it 'preserve object identity' 


    it 'returns false for unrelated object' 

  end

  describe '#path' do
    # Testing for specific XPaths here doesn't make sense since there
    # are many that can refer to the same element
    before do
      @session.visit('/path')
    end

    it 'returns xpath which points to itself' 

  end

  describe '#trigger', requires: %i[js trigger] do
    it 'should allow triggering of custom JS events' 

  end

  describe '#drag_to', requires: %i[js drag] do
    it 'should drag and drop an object' 


    it 'should drag and drop if scrolling is needed' 


    it 'should drag a link' 

  end

  describe '#hover', requires: [:hover] do
    it 'should allow hovering on an element' 


    it 'should allow hovering on an element that needs to be scrolled into view' 

  end

  describe '#click' do
    it 'should not follow a link if no href' 


    it 'should go to the same page if href is blank' 


    it 'should be able to check a checkbox' 


    it 'should be able to uncheck a checkbox' 


    it 'should be able to select a radio button' 


    it 'should allow modifiers', requires: [:js] do
      @session.visit('/with_js')
      @session.find(:css, '#click-test').click(:shift)
      expect(@session).to have_link('Has been shift clicked')
    end

    it 'should allow multiple modifiers', requires: [:js] do
      @session.visit('with_js')
      @session.find(:css, '#click-test').click(:control, :alt, :meta, :shift)
      # Selenium with Chrome on OSX ctrl-click generates a right click so just verify all keys but not click type
      expect(@session).to have_link('alt control meta shift')
    end

    it 'should allow to adjust the click offset', requires: [:js] do
      @session.visit('with_js')
      @session.find(:css, '#click-test').click(x: 5, y: 5)
      link = @session.find(:link, 'has-been-clicked')
      locations = link.text.match(/^Has been clicked at (?<x>[\d\.-]+),(?<y>[\d\.-]+)$/)
      # Resulting click location should be very close to 0, 0 relative to top left corner of the element, but may not be exact due to
      # integer/float conversions and rounding.
      expect(locations[:x].to_f).to be_within(1).of(5)
      expect(locations[:y].to_f).to be_within(1).of(5)
    end

    it 'should be able to click a table row', requires: [:js] do
      @session.visit('/tables')
      tr = @session.find(:css, '#agent_table tr:first-child').click
      expect(tr).to have_css('label', text: 'Clicked')
    end
  end

  describe '#double_click', requires: [:js] do
    it 'should double click an element' 


    it 'should allow modifiers', requires: [:js] do
      @session.visit('/with_js')
      @session.find(:css, '#click-test').double_click(:alt)
      expect(@session).to have_link('Has been alt double clicked')
    end

    it 'should allow to adjust the offset', requires: [:js] do
      @session.visit('with_js')
      @session.find(:css, '#click-test').double_click(x: 10, y: 5)
      link = @session.find(:link, 'has-been-double-clicked')
      locations = link.text.match(/^Has been double clicked at (?<x>[\d\.-]+),(?<y>[\d\.-]+)$/)
      # Resulting click location should be very close to 10, 5 relative to top left corner of the element, but may not be exact due
      # to integer/float conversions and rounding.
      expect(locations[:x].to_f).to be_within(1).of(10)
      expect(locations[:y].to_f).to be_within(1).of(5)
    end
  end

  describe '#right_click', requires: [:js] do
    it 'should right click an element' 


    it 'should allow modifiers', requires: [:js] do
      @session.visit('/with_js')
      @session.find(:css, '#click-test').right_click(:meta)
      expect(@session).to have_link('Has been meta right clicked')
    end

    it 'should allow to adjust the offset', requires: [:js] do
      @session.visit('with_js')
      @session.find(:css, '#click-test').right_click(x: 10, y: 10)
      link = @session.find(:link, 'has-been-right-clicked')
      locations = link.text.match(/^Has been right clicked at (?<x>[\d\.-]+),(?<y>[\d\.-]+)$/)
      # Resulting click location should be very close to 10, 10 relative to top left corner of the element, but may not be exact due
      # to integer/float conversions and rounding
      expect(locations[:x].to_f).to be_within(1).of(10)
      expect(locations[:y].to_f).to be_within(1).of(10)
    end
  end

  describe '#send_keys', requires: [:send_keys] do
    it 'should send a string of keys to an element' 


    it 'should send special characters' 


    it 'should allow for multiple simultaneous keys' 


    it 'should hold modifiers at top level' 


    it 'should generate key events', requires: %i[send_keys js] do
      @session.visit('/with_js')
      @session.find(:css, '#with-key-events').send_keys([:shift, 't'], [:shift, 'w'])
      expect(@session.find(:css, '#key-events-output')).to have_text('keydown:16 keydown:84 keydown:16 keydown:87')
    end
  end

  describe '#execute_script', requires: %i[js es_args] do
    it 'should execute the given script in the context of the element and return nothing' 


    it 'should pass arguments to the script' 

  end

  describe '#evaluate_script', requires: %i[js es_args] do
    it 'should evaluate the given script in the context of the element and  return whatever it produces' 


    it 'should ignore leading whitespace' 


    it 'should pass arguments to the script' 


    it 'should pass multiple arguments' 


    it 'should support returning elements' 

  end

  describe '#evaluate_async_script', requires: %i[js es_args] do
    it 'should evaluate the given script in the context of the element' 


    it 'should support returning elements after asynchronous operation' 

  end

  describe '#reload', requires: [:js] do
    context 'without automatic reload' do
      before { Capybara.automatic_reload = false }

      after { Capybara.automatic_reload = true }

      it 'should reload the current context of the node' 


      it 'should reload a parent node' 


      it 'should not automatically reload' 

    end

    context 'with automatic reload' do
      before do
        Capybara.default_max_wait_time = 4
      end

      it 'should reload the current context of the node automatically' 


      it 'should reload a parent node automatically' 


      it 'should reload a node automatically when using find' 


      it "should not reload nodes which haven't been found with reevaluateable queries" 


      it 'should reload nodes with options' 

    end
  end

  context 'when #synchronize raises server errors' do
    it 'sets an explanatory exception as the cause of server exceptions', requires: %i[server js] do
      quietly { @session.visit('/error') }
      expect do
        @session.find(:css, 'span')
      end.to(raise_error(TestApp::TestAppError) do |e|
        expect(e.cause).to be_a Capybara::CapybaraError
        expect(e.cause.message).to match(/Your application server raised an error/)
      end)
    end

    it 'sets an explanatory exception as the cause of server exceptions with errors with initializers', requires: %i[server js] do
      quietly { @session.visit('/other_error') }
      expect do
        @session.find(:css, 'span')
      end.to(raise_error(TestApp::TestAppOtherError) do |e|
        expect(e.cause).to be_a Capybara::CapybaraError
        expect(e.cause.message).to match(/Your application server raised an error/)
      end)
    end
  end

  def be_an_invalid_element_error(session)
    satisfy { |error| session.driver.invalid_element_errors.any? { |e| error.is_a? e } }
  end
end

