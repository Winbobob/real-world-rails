require 'rails_helper'
require 'i18n/backend/discourse_i18n'
require 'translation_override'

describe I18n::Backend::DiscourseI18n do

  let(:backend) { I18n::Backend::DiscourseI18n.new }

  before do
    I18n.reload!
    backend.store_translations(:en, foo: 'Foo in :en', bar: 'Bar in :en', wat: "Hello %{count}")
    backend.store_translations(:en, items: { one: 'one item', other: "%{count} items" })
    backend.store_translations(:de, bar: 'Bar in :de')
    backend.store_translations(:ru, baz: 'Baz in :ru')
  end

  after do
    I18n.locale = :en
    I18n.reload!
  end

  it 'translates the basics as expected' 


  it 'can be searched by key or value' 


  it 'can return multiple results' 


  describe 'fallbacks' do
    it 'uses fallback locales for searching' 


    it 'uses fallback locales for translating' 


    it 'uses default_locale as fallback when key exists' 

  end

  describe '#exists?' do
    it 'returns true when a key is given that exists' 


    it 'returns true when a key is given that exists in a fallback locale of the locale' 


    it 'returns true when an existing key and an existing locale is given' 


    it 'returns false when a non-existing key and an existing locale is given' 


    it 'returns true when a key is given which is missing from the given locale and exists in a fallback locale' 


    it 'returns true when a key is given which is missing from the given locale and all its fallback locales' 

  end

  describe 'with overrides' do
    it 'returns the overridden key' 


    it 'returns the overridden key after switching the locale' 


    it "can be searched" 


    it 'supports disabling' 


    it 'supports interpolation' 


    it 'supports interpolation named count' 


    it 'ignores interpolation named count if it is not applicable' 


    it 'supports one and other' 


    it 'supports one and other when only a single pluralization key is overridden' 


    it "returns the overriden text when falling back" 


    it "returns override if it exists before falling back" 


    it 'does not affect ActiveModel::Naming#human' 


    describe "client json" do
      it "is empty by default" 


      it "doesn't return server overrides" 


      it "returns client overrides" 

    end
  end

end

