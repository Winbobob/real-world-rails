# frozen_string_literal: true

Capybara::SpecHelper.spec '#has_field' do
  before { @session.visit('/form') }

  it 'should be true if the field is on the page' 


  it 'should be false if the field is not on the page' 


  context 'with value' do
    it 'should be true if a field with the given value is on the page' 


    it 'should be false if the given field is not on the page' 


    it 'should be true after the field has been filled in with the given value' 


    it 'should be false after the field has been filled in with a different value' 

  end

  context 'with type' do
    it 'should be true if a field with the given type is on the page' 


    it 'should be false if the given field is not on the page' 


    it 'it can find type="hidden" elements if explicity specified' 

  end

  context 'with multiple' do
    it 'should be true if a field with the multiple attribute is on the page' 


    it 'should be false if a field without the multiple attribute is not on the page' 

  end
end

Capybara::SpecHelper.spec '#has_no_field' do
  before { @session.visit('/form') }

  it 'should be false if the field is on the page' 


  it 'should be true if the field is not on the page' 


  context 'with value' do
    it 'should be false if a field with the given value is on the page' 


    it 'should be true if the given field is not on the page' 


    it 'should be false after the field has been filled in with the given value' 


    it 'should be true after the field has been filled in with a different value' 

  end

  context 'with type' do
    it 'should be false if a field with the given type is on the page' 


    it 'should be true if the given field is not on the page' 

  end
end

Capybara::SpecHelper.spec '#has_checked_field?' do
  before { @session.visit('/form') }

  it 'should be true if a checked field is on the page' 


  it 'should be true for disabled checkboxes if disabled: true' 


  it 'should be false if an unchecked field is on the page' 


  it 'should be false if no field is on the page' 


  it 'should be false for disabled checkboxes by default' 


  it 'should be false for disabled checkboxes if disabled: false' 


  it 'should be true for disabled checkboxes if disabled: :all' 


  it 'should be true for enabled checkboxes if disabled: :all' 


  it 'should be true after an unchecked checkbox is checked' 


  it 'should be false after a checked checkbox is unchecked' 


  it 'should be true after an unchecked radio button is chosen' 


  it 'should be false after another radio button in the group is chosen' 

end

Capybara::SpecHelper.spec '#has_no_checked_field?' do
  before { @session.visit('/form') }

  it 'should be false if a checked field is on the page' 


  it 'should be false for disabled checkboxes if disabled: true' 


  it 'should be true if an unchecked field is on the page' 


  it 'should be true if no field is on the page' 


  it 'should be true for disabled checkboxes by default' 


  it 'should be true for disabled checkboxes if disabled: false' 

end

Capybara::SpecHelper.spec '#has_unchecked_field?' do
  before { @session.visit('/form') }

  it 'should be false if a checked field is on the page' 


  it 'should be true if an unchecked field is on the page' 


  it 'should be true for disabled unchecked fields if disabled: true' 


  it 'should be false if no field is on the page' 


  it 'should be false for disabled unchecked fields by default' 


  it 'should be false for disabled unchecked fields if disabled: false' 


  it 'should be false after an unchecked checkbox is checked' 


  it 'should be true after a checked checkbox is unchecked' 


  it 'should be false after an unchecked radio button is chosen' 


  it 'should be true after another radio button in the group is chosen' 


  it 'should support locator-less usage' 

end

Capybara::SpecHelper.spec '#has_no_unchecked_field?' do
  before { @session.visit('/form') }

  it 'should be true if a checked field is on the page' 


  it 'should be false if an unchecked field is on the page' 


  it 'should be false for disabled unchecked fields if disabled: true' 


  it 'should be true if no field is on the page' 


  it 'should be true for disabled unchecked fields by default' 


  it 'should be true for disabled unchecked fields if disabled: false' 


  it 'should support locator-less usage' 

end

