# frozen_string_literal: true

require 'spec_helper'

describe 'Site select' do
  before do
    authorize_user(:as_admin)
  end

  context "without multiple sites" do
    it "does not display the site select" 

  end

  context "with multiple sites" do
    let!(:default_site) { create(:alchemy_site, :default) }
    let!(:a_site) { create(:alchemy_site) }

    context "not on pages or languages module" do
      it "does not display the site select" 

    end

    context "on pages and languages module" do
      it "contains all sites in a selectbox" 

    end

    context 'when switching site' do
      it "stores the site in session" 


      context 'when site id is not found' do
        it "stores the default site in session" 

      end
    end
  end
end

