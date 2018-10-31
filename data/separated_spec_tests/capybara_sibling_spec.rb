# frozen_string_literal: true

Capybara::SpecHelper.spec '#sibling' do
  before do
    @session.visit('/with_html')
  end

  after do
    Capybara::Selector.remove(:monkey)
  end

  it "should find a prior sibling element using the given locator" 


  it "should find a following sibling element using the given locator" 


  it "should raise an error if there are multiple matches" 


  context "with css selectors" do
    it "should find the first element using the given locator" 

  end

  context "with custom selector" do
    it "should use the custom selector" 

  end

  it "should raise ElementNotFound with a useful default message if nothing was found" 

end

