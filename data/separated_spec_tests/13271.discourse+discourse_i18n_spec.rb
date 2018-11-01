require 'rails_helper'
require 'i18n/backend/discourse_i18n'
require 'translation_override'

describe I18n::Backend::DiscourseI18n do

  let(:backend) { I18n::Backend::DiscourseI18n.new }

  before do
    backend.reload!
    backend.store_translations(:en, foo: 'Foo in :en', bar: 'Bar in :en', wat: 'Hello %{count}')
    backend.store_translations(:en, items: { one: 'one item', other: '%{count} items' })
    backend.store_translations(:de, bar: 'Bar in :de')
    backend.store_translations(:ru, baz: 'Baz in :ru')
    backend.store_translations(:en, link: '[text](url)')
  end

  after do
    backend.reload!
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
end

