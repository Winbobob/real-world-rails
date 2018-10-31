# frozen_string_literal: true

Capybara::SpecHelper.spec '#assert_matches_selector' do
  before do
    @session.visit('/with_html')
    @element = @session.find(:css, 'span', text: '42')
  end

  it "should be true if the given selector matches the element" 


  it "should be false if the given selector does not match the element" 


  it "should not be callable on the session" 


  it "should wait for match to occur", requires: [:js] do
    @session.visit('/with_js')
    input = @session.find(:css, '#disable-on-click')

    expect(input.assert_matches_selector(:css, 'input:enabled')).to be true
    input.click
    expect(input.assert_matches_selector(:css, 'input:disabled')).to be true
  end

  it "should not accept count options" 


  it "should accept a filter block" 

end

