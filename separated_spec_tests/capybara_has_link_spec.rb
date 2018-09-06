# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_link?' do
  before do
    @session.visit('/with_html')
  end

  it "should be true if the given link is on the page" 


  it "should be false if the given link is not on the page" 

end

Capybara::SpecHelper.spec '#has_no_link?' do
  before do
    @session.visit('/with_html')
  end

  it "should be false if the given link is on the page" 


  it "should be true if the given link is not on the page" 

end

