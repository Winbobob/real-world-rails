# frozen_string_literal: true

Capybara::SpecHelper.spec '#within' do
  before do
    @session.visit('/with_scope')
  end

  context "with CSS selector" do
    it "should click links in the given scope" 


    it "should assert content in the given scope" 


    it "should accept additional options" 

  end

  context "with XPath selector" do
    it "should click links in the given scope" 

  end

  context "with the default selector" do
    it "should use XPath" 

  end

  context "with Node rather than selector" do
    it "should click links in the given scope" 

  end

  context "with the default selector set to CSS" do
    before { Capybara.default_selector = :css }
    it "should use CSS" 

    after { Capybara.default_selector = :xpath }
  end

  context "with nested scopes" do
    it "should respect the inner scope" 


    it "should respect the outer scope" 

  end

  it "should raise an error if the scope is not found on the page" 


  it "should restore the scope when an error is raised" 


  it "should fill in a field and click a button" 


  it "should have #within_element as an alias" 

end

Capybara::SpecHelper.spec '#within_fieldset' do
  before do
    @session.visit('/fieldsets')
  end

  it "should restrict scope to a fieldset given by id" 


  it "should restrict scope to a fieldset given by legend" 

end

Capybara::SpecHelper.spec '#within_table' do
  before do
    @session.visit('/tables')
  end

  it "should restrict scope to a fieldset given by id" 


  it "should restrict scope to a fieldset given by legend" 

end

