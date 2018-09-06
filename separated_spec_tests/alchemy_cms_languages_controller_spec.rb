# frozen_string_literal: true

require 'spec_helper'

describe Alchemy::Admin::LanguagesController do
  routes { Alchemy::Engine.routes }

  before do
    authorize_user(:as_admin)
  end

  describe "#index" do
    context "with multiple sites" do
      let!(:default_site_language) do
        create(:alchemy_language)
      end

      let!(:site_2) do
        create(:alchemy_site, host: 'another-site.com')
      end

      let!(:site_2_language) do
        site_2.default_language
      end

      it 'only shows languages from current site' 

    end

    context "editor users" do
      before do
        authorize_user(:as_editor)
      end

      it "should be able to index language" 

    end
  end

  describe "#new" do
    it "has default language's page_layout set" 

  end
end
