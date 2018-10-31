# frozen_string_literal: true

Capybara::SpecHelper.spec '#match_css?' do
  before do
    @session.visit('/with_html')
    @element = @session.find(:css, 'span', text: '42')
  end

  it 'should be true if the given selector matches the element' 


  it 'should be false if the given selector does not match' 


  it 'should accept an optional filter block' 


  it 'should work with root element found via ancestor' 

end

