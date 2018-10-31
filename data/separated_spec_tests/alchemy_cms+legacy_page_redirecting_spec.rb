# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Redirecting to legacy page urls' do
  let(:page) do
    create(:alchemy_page, :public, name: 'New page name')
  end

  let(:second_page) do
    create(:alchemy_page, :public, name: 'Second Page')
  end

  let(:legacy_page) do
    create(:alchemy_page, :public, name: 'Legacy Url')
  end

  let!(:legacy_url) do
    Alchemy::LegacyPageUrl.create(urlname: 'legacy-url', page: page)
  end

  let(:legacy_url2) do
    Alchemy::LegacyPageUrl.create(urlname: 'legacy-url', page: second_page)
  end

  let(:legacy_url4) do
    Alchemy::LegacyPageUrl.create(
      urlname: 'index.php?option=com_content&view=article&id=48&Itemid=69',
      page: second_page
    )
  end

  context 'if url has an unknown format & get parameters' do
    it "redirects permanently to page that belongs to legacy page url" 

  end

  it "should not pass query string for legacy routes" 


  it "should only redirect to legacy url if no page was found for urlname" 


  it "should redirect to last page that has that legacy url" 


  context 'if the url has get parameters' do
    let(:legacy_url3) do
      Alchemy::LegacyPageUrl.create(urlname: 'index.php?id=2', page: second_page)
    end

    it "redirects" 

  end

  context 'when the url has nested urlname' do
    let(:legacy_url5) do
      Alchemy::LegacyPageUrl.create(urlname: 'nested/legacy/url', page: second_page)
    end

    it "redirects" 

  end
end

