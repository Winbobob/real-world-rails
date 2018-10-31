# frozen_string_literal: true

Capybara::SpecHelper.spec '#find_field' do
  before do
    @session.visit('/form')
  end

  it "should find any field" 


  context "aria_label attribute with Capybara.enable_aria_label" do
    it "should find when true" 


    it "should not find when false" 

  end

  it "casts to string" 


  it "should raise error if the field doesn't exist" 


  it "should raise error if filter option is invalid" 


  context "with :exact option" do
    it "should accept partial matches when false" 


    it "should not accept partial matches when true" 

  end

  context "with :disabled option" do
    it "should find disabled fields when true" 


    it "should not find disabled fields when false" 


    it "should not find disabled fields by default" 


    it "should find disabled fields when :all" 


    it "should find enabled fields when :all" 

  end

  context 'with :readonly option' do
    it "should find readonly fields when true" 


    it "should not find readonly fields when false" 


    it "should ignore readonly by default" 

  end

  context 'with no locator' do
    it 'should use options to find the field' 

  end

  it "should accept an optional filter block" 

end

