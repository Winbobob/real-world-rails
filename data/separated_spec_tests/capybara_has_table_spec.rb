# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_table?' do
  before do
    @session.visit('/tables')
  end

  it "should be true if the table is on the page" 


  it "should be false if the table is not on the page" 

end

Capybara::SpecHelper.spec '#has_no_table?' do
  before do
    @session.visit('/tables')
  end

  it "should be false if the table is on the page" 


  it "should be true if the table is not on the page" 

end

