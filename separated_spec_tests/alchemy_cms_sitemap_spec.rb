# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Requests for PagesController#sitemap' do
  let!(:page) { create(:alchemy_page, :public, sitemap: true) }

  it 'renders valid xml sitemap' 


  it 'lastmod dates are ISO 8601 timestamps' 


  context 'in multi language mode' do
    let!(:root) { page.parent }
    let!(:pages) { [root, page] }

    before do
      allow_any_instance_of(Alchemy::BaseController).to receive('prefix_locale?') { true }
    end

    it 'links in sitemap has locale code included' 


    context 'if the default locale is the page locale' do
      before do
        allow_any_instance_of(Alchemy::BaseController).to receive('prefix_locale?') { false }
      end

      it 'links in sitemap has no locale code included' 

    end
  end
end

