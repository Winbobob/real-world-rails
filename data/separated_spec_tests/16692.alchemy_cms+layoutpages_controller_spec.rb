# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe Admin::LayoutpagesController do
    routes { Alchemy::Engine.routes }

    before(:each) do
      authorize_user(:as_admin)
    end

    describe "#index" do
      it "should assign @layout_root" 


      it "should assign @languages" 


      context "with multiple sites" do
        let!(:language) do
          create(:alchemy_language)
        end

        let!(:site_2) do
          create(:alchemy_site, host: 'another-site.com')
        end

        let(:language_2) do
          site_2.default_language
        end

        it 'only shows languages from current site' 

      end
    end
  end
end

