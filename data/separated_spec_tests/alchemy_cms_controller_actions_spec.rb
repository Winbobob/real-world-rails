# frozen_string_literal: true

require 'spec_helper'

# Here's a tiny custom matcher making it a bit easier to check the
# current session for a language configuration.
#
RSpec::Matchers.define :include_language_information_for do |expected|
  match do |actual|
    actual[:alchemy_language_id] == expected.id
  end
end

describe 'Alchemy::ControllerActions', type: 'controller' do
  # Anonymous controller to test the integration against
  controller(ActionController::Base) do
    include Alchemy::ControllerActions
  end

  describe "#current_alchemy_user" do
    context "with default current_user_method" do
      it "calls current_user by default" 

    end

    context "with custom current_user_method" do
      before do
        Alchemy.current_user_method = 'current_admin'
      end

      it "calls the custom method" 

    end

    context "with not implemented current_user_method" do
      before do
        Alchemy.current_user_method = 'not_implemented_method'
      end

      after do
        Alchemy.current_user_method = 'current_user'
      end

      it "raises an error" 

    end
  end

  describe "#set_alchemy_language" do
    let(:default_language) { Alchemy::Language.default }
    let(:klingon)          { create(:alchemy_language, :klingon) }

    after do
      # We must never change the app's locale
      expect(::I18n.locale).to eq(:en)
    end

    context "with a Language argument" do
      it "should set the language to the passed Language instance" 

    end

    context "with a language id argument" do
      it "should set the language to the language specified by the passed id" 

    end

    context "with a language code argument" do
      it "should set the language to the language specified by the passed code" 

    end

    context "with no lang param" do
      it "should set the default language" 

    end

    context "with language in the session" do
      before do
        allow(controller).to receive(:session).and_return(alchemy_language_id: klingon.id)
      end

      it "should use the language from the session" 


      context "if the language is not on the current site" do
        let(:french_site) do
          create(:alchemy_site, host: 'french.fr')
        end

        let(:french_language) do
          french_site.default_language
        end

        before do
          expect(controller).to receive(:session).at_least(:once) do
            Hash[alchemy_language_id: french_language.id]
          end
        end

        it "should set the default language" 

      end
    end

    context "with lang param" do
      it "should set the language" 


      context "for language that does not exist" do
        before do
          allow(controller).to receive(:params).and_return(locale: 'fo')
          controller.send :set_alchemy_language
        end

        it "should set the language to default" 

      end
    end
  end
end

