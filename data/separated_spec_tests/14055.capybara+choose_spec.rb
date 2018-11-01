# frozen_string_literal: true

Capybara::SpecHelper.spec '#choose' do
  before do
    @session.visit('/form')
  end

  it 'should choose a radio button by id' 


  it 'should choose a radio button by label' 


  it 'should work without a locator string' 


  it 'should be able to choose self when no locator string specified' 


  it 'casts to string' 


  context "with a locator that doesn't exist" do
    it 'should raise an error' 

  end

  context 'with a disabled radio button' do
    it 'should raise an error' 

  end

  context 'with :exact option' do
    it 'should accept partial matches when false' 


    it 'should not accept partial matches when true' 

  end

  context 'with `option` option' do
    it 'can check radio buttons by their value' 


    it 'should raise an error if option not found' 

  end

  context 'with hidden radio buttons' do
    context 'with Capybara.automatic_label_click == true' do
      around do |spec|
        old_click_label, Capybara.automatic_label_click = Capybara.automatic_label_click, true
        spec.run
        Capybara.automatic_label_click = old_click_label
      end

      it 'should select by clicking the label if available' 


      it 'should select self by clicking the label if no locator specified' 


      it 'should raise error if not allowed to click label' 

    end
  end

  it 'should return the chosen radio button' 

end

