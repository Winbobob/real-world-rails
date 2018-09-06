# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe ".t" do
    it 'scopes translations intro alchemy namespace' 

  end

  describe I18n do
    describe '.available_locales' do
      subject { I18n.available_locales }
      it      { is_expected.to be_a Array }
      it      { is_expected.to include(:en) }

      context 'when locales are already set in @@available_locales' do
        before { I18n.class_variable_set(:@@available_locales, [:kl, :jp]) }
        it     { is_expected.to match_array([:kl, :jp]) }
        after  { I18n.class_variable_set(:@@available_locales, nil) }
      end

      context 'when locales are present in other gems' do
        before do
          expect(::I18n).to receive(:load_path) do
            ['/Users/tvd/gems/alchemy_i18n/config/locales/alchemy.de.yml']
          end
        end

        it 'includes them' 

      end

      context 'when same locales are present in multiple gems' do
        before do
          expect(::I18n).to receive(:load_path) do
            [
              '/Users/tvd/gems/alchemy-devise/config/locales/alchemy.de.yml',
              '/Users/tvd/gems/alchemy_i18n/config/locales/alchemy.de.yml'
            ]
          end
        end

        it 'includes them only once' 

      end

      context 'when locales have long iso format' do
        before do
          expect(::I18n).to receive(:load_path) do
            ['/Users/tvd/gems/alchemy_i18n/config/locales/alchemy.zh-CN.yml']
          end
        end

        it 'includes them in long format' 

      end

      context 'multiple locales' do
        before do
          expect(::I18n).to receive(:load_path) do
            [
              '/Users/tvd/gems/alchemy_i18n/config/locales/alchemy.zh-CN.yml',
              '/Users/tvd/gems/alchemy_i18n/config/locales/alchemy.de.yml'
            ]
          end
        end

        it 'are sorted' 

      end
    end

    describe '.available_locales=' do
      it "assigns the given locales to @@available_locales" 

    end
  end
end

