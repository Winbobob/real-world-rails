# frozen_string_literal: true

Capybara::SpecHelper.spec '#title' do
  it "should get the title of the page" 


  context "with css as default selector" do
    before { Capybara.default_selector = :css }
    it "should get the title of the page" 

    after { Capybara.default_selector = :xpath }
  end

  context "within iframe", requires: [:frames] do
    it "should get the title of the top level browsing context" 

  end
end

