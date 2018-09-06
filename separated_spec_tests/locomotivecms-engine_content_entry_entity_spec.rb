require 'spec_helper'

describe Locomotive::API::Entities::ContentEntryEntity do

  subject { described_class }

  attributes =
    %i(
      _slug
      _label
      _position
      _visible
      seo_title
      meta_keywords
      meta_description
    )

  attributes.each do |exposure|
    it { is_expected.to represent(exposure) }
  end

  context 'overrides' do

    let(:content_type)  { create('article content type', :with_select_field_and_options) }
    let(:content_entry) { content_type.entries.create({
      title:          'Hello world',
      body:           'Lorem ipsum',
      picture:        FixturedAsset.open('5k.png'),
      featured:       true,
      published_on:   DateTime.parse('2009/09/10 09:00:00'),
      author_email:   'john@doe.net',
      grade:          4.2,
      duration:       420,
      tags:           ['foo', 'bar'],
      price:          42.0,
      metadata:       { var1: 'Hello', var2: 'world' },
      category_id:    content_type.entries_custom_fields.where(name: 'category').first.select_options.first._id,
      archived_at:    Date.parse('2009/09/12')
    }) }
    let(:entity) { described_class.new(content_entry) }

    subject { entity.serializable_hash }

    it 'returns the slug of the content type' 


    describe 'dynamic fields' do

      it 'returns the string fields' 


      it 'returns the text fields' 


      it 'returns the file fields' 


      it 'returns the boolean fields' 


      it 'returns the date time fields' 


      it 'returns the date fields' 


      it 'returns the email fields' 


      it 'returns the float fields' 


      it 'returns the integer fields' 


      it 'returns the tags fields' 


      it 'returns the money fields' 


      it 'returns the select fields' 


      it 'returns the json fields' 


    end

    describe 'localized dynamic fields' do

      let(:content_type)  { create('localized article content type', :with_select_field_and_options) }
      let(:content_entry) {
        ::Mongoid::Fields::I18n.with_locale(:en) do
          content_type.entries.create(title: 'Hello world')
        end
      }

      before do
        # Hack because other specs change the fallbacks.
        fallbacks = ::Mongoid::Fields::I18n.fallbacks
        if fallbacks && fallbacks[:fr].nil?
          ::Mongoid::Fields::I18n.fallbacks_for(:fr, [])
        end

        ::Mongoid::Fields::I18n.with_locale(:fr) do
          content_entry.title = 'Bonjour monde'
          content_entry.save
        end
      end

      it 'returns the string fields for the default locale' 


      it 'returns the string fields for another locale too' 


    end

  end

end

