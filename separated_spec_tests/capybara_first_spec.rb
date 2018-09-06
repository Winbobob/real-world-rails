# frozen_string_literal: true

Capybara::SpecHelper.spec '#first' do
  before do
    @session.visit('/with_html')
  end

  it "should find the first element using the given locator" 


  it "should raise ElementNotFound when nothing was found" 


  it "should return nil when nothing was found if count options allow no results" 


  it "should accept an XPath instance" 


  it "should raise when unused parameters are passed" 


  context "with css selectors" do
    it "should find the first element using the given selector" 

  end

  context "with xpath selectors" do
    it "should find the first element using the given locator" 

  end

  context "with css as default selector" do
    before { Capybara.default_selector = :css }
    it "should find the first element using the given locator" 

  end

  context "with visible filter" do
    it "should only find visible nodes when true" 


    it "should find nodes regardless of whether they are invisible when false" 


    it "should find nodes regardless of whether they are invisible when :all" 


    it "should find only hidden nodes when :hidden" 


    it "should find only visible nodes when :visible" 


    it "should default to Capybara.ignore_hidden_elements" 

  end

  context "within a scope" do
    before do
      @session.visit('/with_scope')
    end

    it "should find the first element using the given locator" 

  end

  context "waiting behavior", requires: [:js] do
    before do
      @session.visit('/with_js')
    end

    it "should not wait if minimum: 0" 


    it "should wait for at least one match by default" 


    it "should raise an error after waiting if no match" 

  end
end

