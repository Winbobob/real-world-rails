# frozen_string_literal: true

Capybara::SpecHelper.spec Capybara::Selector do
  before do
    @session.visit('/form')
  end

  describe ':label selector' do
    it 'finds a label by text' 


    it 'finds a label by for attribute string' 


    it 'finds a label from nested input using :for filter with id string' 


    it 'finds a label from nested input using :for filter with element' 


    it 'finds the label for an non-nested element when using :for filter' 


    context 'with exact option' do
      it 'matches substrings' 


      it "doesn't match substrings" 

    end
  end

  describe 'field selectors' do
    context 'with :id option' do
      it 'can find specifically by id' 


      it 'can find by regex' 


      it 'can find by case-insensitive id' 

    end

    it 'can find specifically by name' 


    it 'can find specifically by placeholder' 


    it 'can find by type' 


    it 'can find by class' 

  end
end

