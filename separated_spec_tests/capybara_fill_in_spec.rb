# frozen_string_literal: true

Capybara::SpecHelper.spec "#fill_in" do
  before do
    @session.visit('/form')
  end

  it "should fill in a text field by id" 


  it "should fill in a text field by name" 


  it "should fill in a text field by label without for" 


  it "should fill in a url field by label without for" 


  it "should fill in a textarea by id" 


  it "should fill in a textarea by label" 


  it "should fill in a textarea by name" 


  it "should fill in a password field by id" 


  context "Date/Time" do
    it "should fill in a date input" 


    it "should fill in a time input" 


    it "should fill in a datetime input" 

  end

  it "should handle HTML in a textarea" 


  it "should handle newlines in a textarea" 


  it "should fill in a field with a custom type" 


  it "should fill in a field without a type" 


  it "should fill in a text field respecting its maxlength attribute" 


  it "should fill in a password field by name" 


  it "should fill in a password field by label" 


  it "should fill in a password field by name" 


  it "should fill in a field based on current value" 


  it "should fill in a field based on type" 


  it "should throw an exception if a hash containing 'with' is not provided" 


  it "should wait for asynchronous load", requires: [:js] do
    @session.visit('/with_js')
    @session.click_link('Click me')
    @session.fill_in('new_field', with: 'Testing...')
  end

  it "casts to string" 


  it "casts to string if field has maxlength" 


  context 'on a pre-populated textfield with a reformatting onchange', requires: [:js] do
    it 'should only trigger onchange once' 


    it 'should trigger change when clearing field' 

  end

  context "with ignore_hidden_fields" do
    before { Capybara.ignore_hidden_elements = true }
    after  { Capybara.ignore_hidden_elements = false }
    it "should not find a hidden field" 

  end

  context "with a locator that doesn't exist" do
    it "should raise an error" 

  end

  context "on a disabled field" do
    it "should raise an error" 

  end

  context "with :exact option" do
    it "should accept partial matches when false" 


    it "should not accept partial matches when true" 

  end

  it "should return the element filled in" 

end

