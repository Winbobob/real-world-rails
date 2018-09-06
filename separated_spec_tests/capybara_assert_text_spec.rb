# frozen_string_literal: true

Capybara::SpecHelper.spec '#assert_text' do
  it "should be true if the given text is on the page" 


  it "should take scopes into account" 


  it "should raise if scoped to an element which does not have the text" 


  it "should be true if :all given and text is invisible." 


  it "should be true if `Capybara.ignore_hidden_elements = true` and text is invisible." 


  it "should raise error with a helpful message if the requested text is present but invisible" 


  it "should raise error with a helpful message if the requested text is present but with incorrect case" 


  it "should raise error with helpful message if requested text is present but invisible and with incorrect case", requires: [:js] do
    @session.visit('/with_html')
    el = @session.find(:css, '#uppercase')
    expect do
      el.assert_text('text here')
    end.to raise_error(Capybara::ExpectationNotMet, /it was found 1 time using a case insensitive search and it was found 1 time including non-visible text/)
  end

  it "should raise the correct error if requested text is missing but contains regex special characters" 


  it "should be true if the text in the page matches given regexp" 


  it "should be raise error if the text in the page doesn't match given regexp" 


  it "should escape any characters that would have special meaning in a regexp" 


  it "should wait for text to appear", requires: [:js] do
    @session.visit('/with_js')
    @session.click_link('Click me')
    expect(@session.assert_text('Has been clicked')).to eq(true)
  end

  context "with between" do
    it "should be true if the text occurs within the range given" 


    it "should be false if the text occurs more or fewer times than range" 

  end

  context "with wait", requires: [:js] do
    it "should find element if it appears before given wait duration" 


    it "should raise error if it appears after given wait duration" 

  end

  context 'with multiple count filters' do
    before do
      @session.visit('/with_html')
    end

    it 'ignores other filters when :count is specified' 

    context 'with no :count expectation' do
      it 'fails if :minimum is not met' 

      it 'fails if :maximum is not met' 

      it 'fails if :between is not met' 

      it 'succeeds if all combineable expectations are met' 

    end
  end
end

Capybara::SpecHelper.spec '#assert_no_text' do
  it "should raise error if the given text is on the page at least once" 


  it "should be true if scoped to an element which does not have the text" 


  it "should be true if the given text is on the page but not visible" 


  it "should raise error if :all given and text is invisible." 


  it "should raise error if :all given and text is invisible." 


  it "should be true if the text in the page doesn't match given regexp" 


  context "with count" do
    it "should be true if the text occurs within the range given" 


    it "should be false if the text occurs more or fewer times than range" 

  end

  context "with wait", requires: [:js] do
    it "should not find element if it appears after given wait duration" 

  end
end

