# frozen_string_literal: true

Capybara::SpecHelper.spec '#assert_selector' do
  before do
    @session.visit('/with_html')
  end

  it "should be true if the given selector is on the page" 


  it "should be false if the given selector is not on the page" 


  it "should use default selector" 


  it "should respect scopes" 


  context "with count" do
    it "should be true if the content is on the page the given number of times" 


    it "should be false if the content is on the page the given number of times" 


    it "should be false if the content isn't on the page at all" 

  end

  context "with text" do
    it "should discard all matches where the given string is not contained" 


    it "should discard all matches where the given regexp is not matched" 

  end

  context "with wait", requires: [:js] do
    it "should find element if it appears before given wait duration" 

  end
end

Capybara::SpecHelper.spec '#refute_selector' do
  it "should be an alias of #assert_no_selector" 

end

Capybara::SpecHelper.spec '#assert_no_selector' do
  before do
    @session.visit('/with_html')
  end

  it "should be false if the given selector is on the page" 


  it "should be true if the given selector is not on the page" 


  it "should use default selector" 


  it "should respect scopes" 


  context "with count" do
    it "should be false if the content is on the page the given number of times" 


    it "should be true if the content is on the page the wrong number of times" 


    it "should be true if the content isn't on the page at all" 

  end

  context "with text" do
    it "should discard all matches where the given string is contained" 


    it "should discard all matches where the given regexp is matched" 

  end

  context "with wait", requires: [:js] do
    it "should not find element if it appears after given wait duration" 

  end
end

