# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_xpath?' do
  before do
    @session.visit('/with_html')
  end

  it 'should be true if the given selector is on the page' 


  it 'should be false if the given selector is not on the page' 


  it 'should use xpath even if default selector is CSS' 


  it 'should respect scopes' 


  it 'should wait for content to appear', requires: [:js] do
    Capybara.using_wait_time(3) do
      @session.visit('/with_js')
      @session.click_link('Click me') # updates page after 500ms
      expect(@session).to have_xpath("//input[@type='submit' and @value='New Here']")
    end
  end

  context 'with count' do
    it 'should be true if the content occurs the given number of times' 


    it 'should be false if the content occurs a different number of times than the given' 

  end

  context 'with text' do
    it 'should discard all matches where the given string is not contained' 


    it 'should discard all matches where the given regexp is not matched' 

  end
end

Capybara::SpecHelper.spec '#has_no_xpath?' do
  before do
    @session.visit('/with_html')
  end

  it 'should be false if the given selector is on the page' 


  it 'should be true if the given selector is not on the page' 


  it 'should use xpath even if default selector is CSS' 


  it 'should respect scopes' 


  it 'should wait for content to disappear', requires: [:js] do
    Capybara.default_max_wait_time = 2
    @session.visit('/with_js')
    @session.click_link('Click me')
    expect(@session).to have_no_xpath("//p[@id='change']")
  end

  context 'with count' do
    it 'should be false if the content occurs the given number of times' 


    it 'should be true if the content occurs a different number of times than the given' 

  end

  context 'with text' do
    it 'should discard all matches where the given string is contained' 


    it 'should discard all matches where the given regexp is matched' 

  end
end

