# frozen_string_literal: true

Capybara::SpecHelper.spec '#match_selector?' do
  before do
    @session.visit('/with_html')
    @element = @session.find('//span', text: '42')
  end

  it 'should be true if the element matches the given selector' 


  it 'should be false if the element does not match the given selector' 


  it 'should use default selector' 


  it 'should work with elements located via a sibling selector' 


  it 'should work with the html element' 


  context 'with text' do
    it 'should discard all matches where the given string is not contained' 

  end

  it 'should have css sugar' 


  it 'should have xpath sugar' 


  it 'should accept selector filters' 


  it 'should accept a custom filter block' 

end

Capybara::SpecHelper.spec '#not_matches_selector?' do
  before do
    @session.visit('/with_html')
    @element = @session.find(:css, 'span', text: 42)
  end

  it 'should be false if the given selector matches the element' 


  it 'should be true if the given selector does not match the element' 


  it 'should use default selector' 


  context 'with text' do
    it 'should discard all matches where the given string is contained' 

  end

  it 'should have CSS sugar' 


  it 'should have xpath sugar' 

end

