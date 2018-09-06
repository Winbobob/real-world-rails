# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_css?' do
  before do
    @session.visit('/with_html')
  end

  it "should be true if the given selector is on the page" 


  it "should be false if the given selector is not on the page" 


  it "should respect scopes" 


  it "should wait for content to appear", requires: [:js] do
    @session.visit('/with_js')
    @session.click_link('Click me')
    expect(@session).to have_css("input[type='submit'][value='New Here']")
  end

  context "with between" do
    it "should be true if the content occurs within the range given" 


    it "should be false if the content occurs more or fewer times than range" 

  end

  context "with count" do
    it "should be true if the content occurs the given number of times" 


    it "should be false if the content occurs a different number of times than the given" 


    it "should coerce count to an integer" 

  end

  context "with maximum" do
    it "should be true when content occurs same or fewer times than given" 


    it "should be false when content occurs more times than given" 


    it "should coerce maximum to an integer" 

  end

  context "with minimum" do
    it "should be true when content occurs same or more times than given" 


    it "should be false when content occurs fewer times than given" 


    it "should coerce minimum to an integer" 

  end

  context "with text" do
    it "should discard all matches where the given string is not contained" 


    it "should discard all matches where the given regexp is not matched" 

  end

  it "should allow escapes in the CSS selector" 

end

Capybara::SpecHelper.spec '#has_no_css?' do
  before do
    @session.visit('/with_html')
  end

  it "should be false if the given selector is on the page" 


  it "should be true if the given selector is not on the page" 


  it "should respect scopes" 


  it "should wait for content to disappear", requires: [:js] do
    @session.visit('/with_js')
    @session.click_link('Click me')
    expect(@session).to have_no_css("p#change")
  end

  context "with between" do
    it "should be false if the content occurs within the range given" 


    it "should be true if the content occurs more or fewer times than range" 

  end

  context "with count" do
    it "should be false if the content is on the page the given number of times" 


    it "should be true if the content is on the page the given number of times" 


    it "should coerce count to an integer" 

  end

  context "with maximum" do
    it "should be false when content occurs same or fewer times than given" 


    it "should be true when content occurs more times than given" 


    it "should coerce maximum to an integer" 

  end

  context "with minimum" do
    it "should be false when content occurs same or more times than given" 


    it "should be true when content occurs fewer times than given" 


    it "should coerce minimum to an integer" 

  end

  context "with text" do
    it "should discard all matches where the given string is not contained" 


    it "should discard all matches where the given regexp is not matched" 

  end
end

