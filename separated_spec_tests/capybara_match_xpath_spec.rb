# frozen_string_literal: true

Capybara::SpecHelper.spec '#match_xpath?' do
  before do
    @session.visit('/with_html')
    @element = @session.find(:css, 'span.number')
  end

  it "should be true if the given selector is on the page" 


  it "should be false if the given selector is not on the page" 


  it "should use xpath even if default selector is CSS" 

end

