# frozen_string_literal: true

Capybara::SpecHelper.spec '#find_link' do
  before do
    @session.visit('/with_html')
  end

  it 'should find any link' 


  context 'aria_label attribute with Capybara.enable_aria_label' do
    it 'should find when true' 


    it 'should not find when false' 

  end

  it 'casts to string' 


  it "should raise error if the field doesn't exist" 


  context 'with :exact option' do
    it 'should accept partial matches when false' 


    it 'should not accept partial matches when true' 

  end

  context 'without locator' do
    it 'should use options' 

  end

  context 'download filter' do
    it 'finds a download link' 


    it "doesn't find a download link if download is false" 


    it 'finds a renaming download link' 


    it 'raises if passed an invalid value' 

  end
end

