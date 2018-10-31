# frozen_string_literal: true

Capybara::SpecHelper.spec '#uncheck' do
  before do
    @session.visit('/form')
  end

  it 'should uncheck a checkbox by id' 


  it 'should uncheck a checkbox by label' 


  it 'should work without a locator string' 


  it 'should be able to uncheck itself if no locator specified' 


  it 'casts to string' 


  context 'with :exact option' do
    it 'should accept partial matches when false' 


    it 'should not accept partial matches when true' 

  end

  context 'when checkbox hidden' do
    context 'with Capybara.automatic_label_click == true' do
      around do |spec|
        old_click_label, Capybara.automatic_label_click = Capybara.automatic_label_click, true
        spec.run
        Capybara.automatic_label_click = old_click_label
      end

      it 'should uncheck via clicking the label with :for attribute if possible' 


      it 'should uncheck via clicking the wrapping label if possible' 


      it 'should not click the label if unneeded' 


      it 'should raise original error when no label available' 


      it 'should raise error if not allowed to click label' 


      it 'should include node filter description in error if necessary' 

    end
  end
end

