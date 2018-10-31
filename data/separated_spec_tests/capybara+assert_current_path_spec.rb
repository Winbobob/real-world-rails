# frozen_string_literal: true

Capybara::SpecHelper.spec '#assert_current_path' do
  before do
    @session.visit('/with_js')
  end

  it 'should not raise if the page has the given current path' 


  it 'should allow regexp matches' 


  it 'should wait for current_path', requires: [:js] do
    @session.click_link('Change page')
    expect { @session.assert_current_path('/with_html') }.not_to raise_error
  end

  it 'should raise if the page has not the given current_path' 


  it 'should check query options' 


  it 'should compare the full url' 


  it 'should ignore the query' 


  it 'should not cause an exception when current_url is nil' 

end

Capybara::SpecHelper.spec '#assert_no_current_path?' do
  before do
    @session.visit('/with_js')
  end

  it 'should raise if the page has the given current_path' 


  it 'should allow regexp matches' 


  it 'should wait for current_path to disappear', requires: [:js] do
    @session.click_link('Change page')
    expect { @session.assert_no_current_path('/with_js') }.not_to raise_error
  end

  it 'should not raise if the page has not the given current_path' 


  it 'should not cause an exception when current_url is nil' 

end

