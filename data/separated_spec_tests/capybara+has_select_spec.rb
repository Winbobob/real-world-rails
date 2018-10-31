# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_select?' do
  before { @session.visit('/form') }

  it 'should be true if the field is on the page' 


  it 'should be false if the field is not on the page' 


  context 'with selected value' do
    it 'should be true if a field with the given value is on the page' 


    it 'should be false if the given field is not on the page' 


    it 'should be true after the given value is selected' 


    it 'should be false after a different value is selected' 


    it 'should be true after the given values are selected' 


    it 'should be false after one of the values is unselected' 


    it "should be true even when the selected option invisible, regardless of the select's visibility" 

  end

  context 'with partial select' do
    it 'should be true if a field with the given partial values is on the page' 


    it 'should be false if a field with the given partial values is not on the page' 


    it 'should be true after the given partial value is selected' 


    it 'should be false after one of the given partial values is unselected' 


    it "should be true even when the selected values are invisible, regardless of the select's visibility" 


    it 'should support non array partial values' 

  end

  context 'with exact options' do
    it 'should be true if a field with the given options is on the page' 


    it 'should be false if the given field is not on the page' 


    it 'should be true even when the options are invisible, if the select itself is invisible' 

  end

  context 'with partial options' do
    it 'should be true if a field with the given partial options is on the page' 


    it 'should be false if a field with the given partial options is not on the page' 


    it 'should be true even when the options are invisible, if the select itself is invisible' 

  end

  context 'with multiple option' do
    it 'should find multiple selects if true' 


    it 'should not find multiple selects if false' 


    it 'should find both if not specified' 

  end

  it 'should support locator-less usage' 

end

Capybara::SpecHelper.spec '#has_no_select?' do
  before { @session.visit('/form') }

  it 'should be false if the field is on the page' 


  it 'should be true if the field is not on the page' 


  context 'with selected value' do
    it 'should be false if a field with the given value is on the page' 


    it 'should be true if the given field is not on the page' 


    it 'should be false after the given value is selected' 


    it 'should be true after a different value is selected' 


    it 'should be false after the given values are selected' 


    it 'should be true after one of the values is unselected' 

  end

  context 'with partial select' do
    it 'should be false if a field with the given partial values is on the page' 


    it 'should be true if a field with the given partial values is not on the page' 


    it 'should be false after the given partial value is selected' 


    it 'should be true after one of the given partial values is unselected' 


    it 'should support non array partial values' 

  end

  context 'with exact options' do
    it 'should be false if a field with the given options is on the page' 


    it 'should be true if the given field is not on the page' 

  end

  context 'with partial options' do
    it 'should be false if a field with the given partial options is on the page' 


    it 'should be true if a field with the given partial options is not on the page' 

  end

  it 'should support locator-less usage' 

end

