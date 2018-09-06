# frozen_string_literal: true

require 'spec_helper'

RSpec.feature "Admin::LanguagesFeatures", type: :feature do
  before do
    authorize_user(:as_admin)
  end

  describe 'creating a new language' do
    context 'when selected locale is not an available locale' do
      before do
        allow(::I18n).to receive(:available_locales) { [:de, :en] }
      end

      it 'shows a locale select and an error message' 

    end

    context "with multiple sites" do
      let!(:default_site) { create(:alchemy_site, :default) }

      let!(:site_2) do
        create(:alchemy_site, host: 'another-site.com')
      end

      let(:language) do
        Alchemy::Language.last
      end

      it 'creates language for current site' 

    end
  end

  describe 'editing an language' do
    let!(:language) { create(:alchemy_language) }

    context 'when selected locale has multiple matching locale files' do
      before do
        allow(::I18n).to receive(:available_locales) { [:de, :'de-at', :en, :'en-uk'] }
      end

      it 'shows a locale select with matching locales only' 

    end

    context 'when selected locale has one matching locale file' do
      before do
        allow(::I18n).to receive(:available_locales) { [:de, :en, :'en-uk'] }
      end

      it 'shows a locale select with matching locale only' 

    end

    context 'when selected locale has no matching locale files' do
      before do
        allow(::I18n).to receive(:available_locales) { [:jp, :es] }
      end

      it 'shows a locale select with all available locales' 

    end
  end
end

