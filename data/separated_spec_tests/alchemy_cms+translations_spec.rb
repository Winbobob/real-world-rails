# frozen_string_literal: true

require 'spec_helper'

describe Alchemy::Admin::DashboardController do
  routes { Alchemy::Engine.routes }

  context "in admin backend" do
    let(:dummy_user) { mock_model(Alchemy.user_class, alchemy_roles: %w(admin), language: 'de') }

    before { authorize_user(dummy_user) }

    it "should be possible to set the locale of the admin backend via params" 


    it "should store the current locale in the session" 


    it "should be possible to change the current locale in the session" 


    context 'with unknown locale' do
      it "it uses the users default language" 

    end

    context "if no other parameter is given" do
      it "should use the current users language setting" 


      context "if user has no preferred locale" do
        let(:dummy_user) { mock_model(Alchemy.user_class, alchemy_roles: %w(admin), language: nil) }

        it "should use the browsers language setting" 

      end

      context "if user language is an instance of a model" do
        let(:language) { create(:alchemy_language) }
        let(:dummy_user) { mock_model(Alchemy.user_class, alchemy_roles: %w(admin), language: language) }

        context "if language doesn't return a valid locale symbol" do
          it "should use the browsers language setting" 

        end

        context "if language returns a valid locale symbol" do
          before { allow(language).to receive(:to_sym).and_return(:nl) }

          it "should use the locale of the user language" 

        end
      end
    end
  end
end

