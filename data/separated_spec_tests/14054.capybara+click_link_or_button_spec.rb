# frozen_string_literal: true

Capybara::SpecHelper.spec '#click_link_or_button' do
  it 'should click on a link' 


  it 'should click on a button' 


  it 'should click on a button with no type attribute' 


  it 'should be aliased as click_on' 


  it 'should wait for asynchronous load', requires: [:js] do
    Capybara.default_max_wait_time = 2
    @session.visit('/with_js')
    @session.click_link('Click me')
    @session.click_link_or_button('Has been clicked')
  end

  it 'casts to string' 


  context 'with :exact option' do
    context 'when `false`' do
      it 'clicks on approximately matching link' 


      it 'clicks on approximately matching button' 

    end

    context 'when `true`' do
      it 'does not click on link which matches approximately' 


      it 'does not click on approximately matching button' 

    end
  end

  context "with a locator that doesn't exist" do
    it 'should raise an error' 

  end

  context 'with :disabled option' do
    it 'ignores disabled buttons when false' 


    it 'ignores disabled buttons by default' 


    it 'happily clicks on links which incorrectly have the disabled attribute' 

  end

  it 'should return the element clicked' 

end

