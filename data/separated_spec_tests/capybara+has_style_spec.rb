# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_style?', requires: [:css] do
  before do
    @session.visit('/with_html')
  end

  it 'should be true if the element has the given style' 


  it 'should be false if the element does not have the given style' 


  it 'allows Regexp for value matching' 

end

