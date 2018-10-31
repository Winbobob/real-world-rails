# frozen_string_literal: true

Capybara::SpecHelper.spec '#text' do
  it 'should print the text of the page' 


  it 'ignores invisible text by default' 


  it 'shows invisible text if `:all` given' 


  it 'ignores invisible text if `:visible` given' 


  it 'ignores invisible text if `Capybara.ignore_hidden_elements = true`' 


  it 'ignores invisible text if `Capybara.visible_text_only = true`' 


  it 'ignores invisible text if ancestor is invisible' 


  context 'with css as default selector' do
    before { Capybara.default_selector = :css }

    after { Capybara.default_selector = :xpath }

    it 'should print the text of the page' 

  end

  it 'should be correctly normalized when visible' 


  it 'should be a textContent with irrelevant whitespace collapsed when non-visible' 


  it 'should strip correctly' 

end

