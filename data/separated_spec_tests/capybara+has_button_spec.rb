# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_button?' do
  before do
    @session.visit('/form')
  end

  it 'should be true if the given button is on the page' 


  it 'should be true for disabled buttons if disabled: true' 


  it 'should be false if the given button is not on the page' 


  it 'should be false for disabled buttons by default' 


  it 'should be false for disabled buttons if disabled: false' 


  it 'should be true for disabled buttons if disabled: :all' 


  it 'should be true for enabled buttons if disabled: :all' 


  it 'can verify button type' 

end

Capybara::SpecHelper.spec '#has_no_button?' do
  before do
    @session.visit('/form')
  end

  it 'should be true if the given button is on the page' 


  it 'should be true for disabled buttons if disabled: true' 


  it 'should be false if the given button is not on the page' 


  it 'should be false for disabled buttons by default' 


  it 'should be false for disabled buttons if disabled: false' 

end

