# frozen_string_literal: true

Capybara::SpecHelper.spec '#ancestor' do
  before do
    @session.visit('/with_html')
  end

  after do
    Capybara::Selector.remove(:monkey)
  end

  it 'should find the ancestor element using the given locator' 


  it 'should find the ancestor element using the given locator and options' 


  it 'should raise an error if there are multiple matches' 


  context 'with css selectors' do
    it 'should find the first element using the given locator' 


    it 'should support pseudo selectors' 

  end

  context 'with xpath selectors' do
    it 'should find the first element using the given locator' 

  end

  context 'with custom selector' do
    it 'should use the custom selector' 

  end

  it 'should raise ElementNotFound with a useful default message if nothing was found' 


  context 'within a scope' do
    it 'should limit the ancestors to inside the scope' 

  end

  it 'should raise if selector type is unknown' 

end

