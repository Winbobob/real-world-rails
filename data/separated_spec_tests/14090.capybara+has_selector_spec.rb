# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_selector?' do
  before do
    @session.visit('/with_html')
  end

  it 'should be true if the given selector is on the page' 


  it 'should be false if the given selector is not on the page' 


  it 'should use default selector' 


  it 'should respect scopes' 


  it 'should accept a filter block' 


  context 'with count' do
    it 'should be true if the content is on the page the given number of times' 


    it 'should be false if the content is on the page the given number of times' 


    it "should be false if the content isn't on the page at all" 

  end

  context 'with text' do
    it 'should discard all matches where the given string is not contained' 


    it 'should respect visibility setting' 


    it 'should discard all matches where the given regexp is not matched' 


    it 'should raise when extra parameters passed' 


    context 'with whitespace normalization' do
      context 'Capybara.default_normalize_ws = false' do
        it 'should support normalize_ws option' 

      end

      context 'Capybara.default_normalize_ws = true' do
        it 'should support normalize_ws option' 

      end
    end
  end

  context 'with exact_text' do
    context 'string' do
      it 'should only match elements that match exactly' 

    end

    context 'boolean' do
      it 'should only match elements that match exactly when true' 


      it 'should match substrings when false' 

    end
  end

  context 'datalist' do
    it 'should match options' 

  end
end

Capybara::SpecHelper.spec '#has_no_selector?' do
  before do
    @session.visit('/with_html')
  end

  it 'should be false if the given selector is on the page' 


  it 'should be true if the given selector is not on the page' 


  it 'should use default selector' 


  it 'should respect scopes' 


  it 'should accept a filter block' 


  context 'with count' do
    it 'should be false if the content is on the page the given number of times' 


    it 'should be true if the content is on the page the wrong number of times' 


    it "should be true if the content isn't on the page at all" 

  end

  context 'with text' do
    it 'should discard all matches where the given string is contained' 


    it 'should discard all matches where the given regexp is matched' 

  end
end

