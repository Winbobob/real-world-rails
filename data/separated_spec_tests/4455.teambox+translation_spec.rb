require 'spec_helper'

describe 'Translations' do

  before do
    I18n.backend.store_translations :en, :test_number => "Test number %{number}"
    @old_locale = I18n.locale
    I18n.locale=:ca
  end

  after do
    I18n.locale= @old_locale
  end

  it "should fall back to the default locale when the key doesn't exist" 


  it "should fall back to the default locale when the interpolation doesn't work" 


  it "should translate normally when everything is alright" 


end

