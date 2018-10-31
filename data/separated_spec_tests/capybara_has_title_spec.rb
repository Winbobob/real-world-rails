# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_title?' do
  before do
    @session.visit('/with_js')
  end

  it "should be true if the page has the given title" 


  it "should allow regexp matches" 


  it "should wait for title", requires: [:js] do
    @session.click_link("Change title")
    expect(@session).to have_title("changed title")
  end

  it "should be false if the page has not the given title" 


  it "should default to exact: false matching" 


  it "should match exactly if exact: true option passed" 


  it "should match partial if exact: false option passed" 

end

Capybara::SpecHelper.spec '#has_no_title?' do
  before do
    @session.visit('/with_js')
  end

  it "should be false if the page has the given title" 


  it "should allow regexp matches" 


  it "should wait for title to disappear", requires: [:js] do
    Capybara.using_wait_time(5) do
      @session.click_link("Change title") # triggers title change after 400ms
      expect(@session).to have_no_title('with_js')
    end
  end

  it "should be true if the page has not the given title" 

end

