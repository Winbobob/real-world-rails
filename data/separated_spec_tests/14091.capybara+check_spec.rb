# frozen_string_literal: true

Capybara::SpecHelper.spec '#check' do
  before do
    @session.visit('/form')
  end

  describe "'checked' attribute" do
    it 'should be true if checked' 


    it 'should be false if unchecked' 

  end

  it 'should trigger associated events', requires: [:js] do
    @session.visit('/with_js')
    @session.check('checkbox_with_event')
    expect(@session).to have_css('#checkbox_event_triggered')
  end

  describe 'checking' do
    it 'should not change an already checked checkbox' 


    it 'should check an unchecked checkbox' 

  end

  describe 'unchecking' do
    it 'should not change an already unchecked checkbox' 


    it 'should uncheck a checked checkbox' 

  end

  it 'should check a checkbox by id' 


  it 'should check a checkbox by label' 


  it 'should work without a locator string' 


  it 'should be able to check itself if no locator specified' 


  it 'casts to string' 


  context "with a locator that doesn't exist" do
    it 'should raise an error' 

  end

  context 'with a disabled checkbox' do
    it 'should raise an error' 

  end

  context 'with :exact option' do
    it 'should accept partial matches when false' 


    it 'should not accept partial matches when true' 

  end

  context 'with `option` option' do
    it 'can check boxes by their value' 


    it 'should raise an error if option not found' 

  end

  context 'when checkbox hidden' do
    context 'with Capybara.automatic_label_click == true' do
      around do |spec|
        old_click_label, Capybara.automatic_label_click = Capybara.automatic_label_click, true
        spec.run
        Capybara.automatic_label_click = old_click_label
      end

      it 'should check via clicking the label with :for attribute if possible' 


      it 'should check via clicking the wrapping label if possible' 


      it 'should check via clicking the label with :for attribute if locator nil' 


      it 'should check self via clicking the wrapping label if locator nil' 


      it 'should not click the label if unneeded' 


      it 'should raise original error when no label available' 


      it 'should raise error if not allowed to click label' 

    end

    context 'with Capybara.automatic_label_click == false' do
      around do |spec|
        old_label_click, Capybara.automatic_label_click = Capybara.automatic_label_click, false
        spec.run
        Capybara.automatic_label_click = old_label_click
      end

      it 'should raise error if checkbox not visible' 


      it 'should include node filter in error if verified' 


      context 'with allow_label_click == true' do
        it 'should check via the label if input is hidden' 


        it 'should not wait the full time if label can be clicked' 


        it 'should check via the label if input is moved off the left edge of the page' 


        it 'should check via the label if input is visible but blocked by another element' 

      end
    end
  end
end

