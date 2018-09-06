# frozen_string_literal: true

Capybara::SpecHelper.spec '#have_none_of_selectors' do
  before do
    @session.visit('/with_html')
  end

  it "should be false if any of the given locators are on the page" 


  it "should be true if none of the given locators are on the page" 


  it "should use default selector" 


  context "should respect scopes" do
    it "when used with `within`" 


    it "when called on an element" 

  end

  context "with options" do
    it "should apply the options to all locators" 


    it "should discard all matches where the given regexp is matched" 

  end

  context "with wait", requires: [:js] do
    it "should not find elements if they appear after given wait duration" 

  end

  it "cannot be negated" 

end

