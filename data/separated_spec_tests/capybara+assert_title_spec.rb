# frozen_string_literal: true

Capybara::SpecHelper.spec '#assert_title' do
  before do
    @session.visit('/with_js')
  end

  it "should not raise if the page's title contains the given string" 


  it 'should not raise when given an empty string' 


  it 'should allow regexp matches' 


  it 'should wait for title', requires: [:js] do
    @session.click_link('Change title')
    expect do
      @session.assert_title('changed title', wait: 3)
    end.not_to raise_error
  end

  it "should raise error if the title doesn't contain the given string" 


  it 'should not normalize given title' 


  it 'should match correctly normalized title' 


  it 'should not normalize given title in error message' 

end

Capybara::SpecHelper.spec '#assert_no_title' do
  before do
    @session.visit('/with_js')
  end

  it 'should raise error if the title contains the given string' 


  it 'should allow regexp matches' 


  it 'should wait for title to disappear', requires: [:js] do
    @session.click_link('Change title')
    expect do
      @session.assert_no_title('with_js', wait: 3)
    end.not_to raise_error
  end

  it "should not raise if the title doesn't contain the given string" 

end

