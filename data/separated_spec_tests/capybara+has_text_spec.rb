# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_text?' do
  it 'should be true if the given text is on the page at least once' 


  it 'should be true if scoped to an element which has the text' 


  it 'should be false if scoped to an element which does not have the text' 


  it 'should ignore tags' 


  it 'should search correctly normalized text' 


  it 'should search whitespace collapsed text' 


  context 'with enabled default collapsing whitespace' do
    before { Capybara.default_normalize_ws = true }

    it 'should search unnormalized text' 


    it 'should search whitespace collapsed text' 

  end

  it 'should be false if the given text is not on the page' 


  it 'should handle single quotes in the text' 


  it 'should handle double quotes in the text' 


  it 'should handle mixed single and double quotes in the text' 


  it 'should be false if text is in the title tag in the head' 


  it 'should be false if text is inside a script tag in the body' 


  it 'should be false if the given text is on the page but not visible' 


  it 'should be true if :all given and text is invisible.' 


  it 'should be true if `Capybara.ignore_hidden_elements = false` and text is invisible.' 


  it 'should be true if the text in the page matches given regexp' 


  it "should be false if the text in the page doesn't match given regexp" 


  context 'with exact: true option' do
    it 'should be true if text matches exactly' 


    it "should be false if text doesn't match exactly" 

  end

  it 'should escape any characters that would have special meaning in a regexp' 


  it 'should accept non-string parameters' 


  it 'should be true when passed nil' 


  it 'should wait for text to appear', requires: [:js] do
    Capybara.using_wait_time(3) do
      @session.visit('/with_js')
      @session.click_link('Click me')
      expect(@session).to have_text('Has been clicked')
    end
  end

  context 'with between' do
    it 'should be true if the text occurs within the range given' 


    it 'should be false if the text occurs more or fewer times than range' 

  end

  context 'with count' do
    it 'should be true if the text occurs the given number of times' 


    it 'should be false if the text occurs a different number of times than the given' 


    it 'should coerce count to an integer' 

  end

  context 'with maximum' do
    it 'should be true when text occurs same or fewer times than given' 


    it 'should be false when text occurs more times than given' 


    it 'should coerce maximum to an integer' 

  end

  context 'with minimum' do
    it 'should be true when text occurs same or more times than given' 


    it 'should be false when text occurs fewer times than given' 


    it 'should coerce minimum to an integer' 

  end

  context 'with wait', requires: [:js] do
    it 'should find element if it appears before given wait duration' 

  end

  it 'should raise an error if an invalid option is passed' 

end

Capybara::SpecHelper.spec '#has_no_text?' do
  it 'should be false if the given text is on the page at least once' 


  it 'should be false if scoped to an element which has the text' 


  it 'should be true if scoped to an element which does not have the text' 


  it 'should ignore tags' 


  it 'should be true if the given text is not on the page' 


  it 'should handle single quotes in the text' 


  it 'should handle double quotes in the text' 


  it 'should handle mixed single and double quotes in the text' 


  it 'should be true if text is in the title tag in the head' 


  it 'should be true if text is inside a script tag in the body' 


  it 'should be true if the given text is on the page but not visible' 


  it 'should be false if :all given and text is invisible.' 


  it 'should be false if `Capybara.ignore_hidden_elements = false` and text is invisible.' 


  it "should be true if the text in the page doesn't match given regexp" 


  it 'should be false if the text in the page  matches given regexp' 


  it 'should escape any characters that would have special meaning in a regexp' 


  it 'should wait for text to disappear', requires: [:js] do
    Capybara.default_max_wait_time = 2
    @session.visit('/with_js')
    @session.click_link('Click me')
    expect(@session).to have_no_text('I changed it')
  end

  context 'with wait', requires: [:js] do
    it 'should not find element if it appears after given wait duration' 

  end
end

