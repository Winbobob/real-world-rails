# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_current_path?' do
  before do
    @session.visit('/with_js')
  end

  it 'should be true if the page has the given current path' 


  it 'should allow regexp matches' 


  it 'should not raise an error when non-http' 


  it 'should handle non-escaped query options' 


  it 'should handle escaped query options' 


  it 'should wait for current_path', requires: [:js] do
    @session.click_link('Change page')
    expect(@session).to have_current_path('/with_html', wait: 3)
  end

  it 'should be false if the page has not the given current_path' 


  it 'should check query options' 


  it 'should compare the full url if url: true is used' 


  it 'should not compare the full url if url: true is not passed' 


  it 'should not compare the full url if url: false is passed' 


  it 'should default to full url if value is a url' 


  it 'should ignore the query' 


  it 'should not raise an exception if the current_url is nil' 

end

Capybara::SpecHelper.spec '#has_no_current_path?' do
  before do
    @session.visit('/with_js')
  end

  it 'should be false if the page has the given current_path' 


  it 'should allow regexp matches' 


  it 'should wait for current_path to disappear', requires: [:js] do
    Capybara.using_wait_time(3) do
      @session.click_link('Change page')
      expect(@session).to have_no_current_path('/with_js')
    end
  end

  it 'should be true if the page has not the given current_path' 


  it 'should not raise an exception if the current_url is nil' 

end

