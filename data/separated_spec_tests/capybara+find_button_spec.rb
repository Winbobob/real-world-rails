# frozen_string_literal: true

Capybara::SpecHelper.spec '#find_button' do
  before do
    @session.visit('/form')
  end

  it 'should find any button' 


  context 'aria_label attribute with Capybara.enable_aria_label' do
    it 'should find when true' 


    it 'should not find when false' 

  end

  it 'casts to string' 


  it "should raise error if the button doesn't exist" 


  context 'with :exact option' do
    it 'should accept partial matches when false' 


    it 'should not accept partial matches when true' 

  end

  context 'with :disabled option' do
    it 'should find disabled buttons when true' 


    it 'should not find disabled buttons when false' 


    it 'should default to not finding disabled buttons' 


    it 'should find disabled buttons when :all' 

  end

  context 'without locator' do
    it 'should use options' 

  end
end

