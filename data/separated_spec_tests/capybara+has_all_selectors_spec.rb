# frozen_string_literal: true

Capybara::SpecHelper.spec '#have_all_of_selectors' do
  before do
    @session.visit('/with_html')
  end

  it 'should be true if the given selectors are on the page' 


  it 'should be false if any of the given selectors are not on the page' 


  it 'should use default selector' 


  context 'should respect scopes' do
    it 'when used with `within`' 


    it 'when called on elements' 

  end

  context 'with options' do
    it 'should apply options to all locators' 

  end

  context 'with wait', requires: [:js] do
    it 'should not raise error if all the elements appear before given wait duration' 

  end

  it 'cannot be negated' 

end

