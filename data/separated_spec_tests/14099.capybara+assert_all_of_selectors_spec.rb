# frozen_string_literal: true

Capybara::SpecHelper.spec '#assert_all_of_selectors' do
  before do
    @session.visit('/with_html')
  end

  it 'should be true if the given selectors are on the page' 


  it 'should be false if any of the given selectors are not on the page' 


  it 'should use default selector' 


  it 'should support filter block' 


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
end

Capybara::SpecHelper.spec '#assert_none_of_selectors' do
  before do
    @session.visit('/with_html')
  end

  it 'should be false if any of the given locators are on the page' 


  it 'should be true if none of the given locators are on the page' 


  it 'should use default selector' 


  context 'should respect scopes' do
    it 'when used with `within`' 


    it 'when called on an element' 

  end

  context 'with options' do
    it 'should apply the options to all locators' 


    it 'should discard all matches where the given regexp is matched' 

  end

  context 'with wait', requires: [:js] do
    it 'should not find elements if they appear after given wait duration' 

  end
end

Capybara::SpecHelper.spec '#assert_any_of_selectors' do
  before do
    @session.visit('/with_html')
  end

  it 'should be true if any of the given selectors are on the page' 


  it 'should be false if none of the given selectors are on the page' 


  it 'should use default selector' 


  it 'should support filter block' 

end

