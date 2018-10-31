require 'spec_helper'

describe Locomotive::API::Entities::SiteEntity do

  subject { described_class }

  %i(name locales handle domains seo_title meta_keywords
    meta_description robots_txt cache_enabled asset_host).each do |exposure|
      it { is_expected.to represent(exposure) }
    end

  context 'overrides' do
    let!(:admin)  { create(:admin) }
    let!(:site)   { admin.site }
    let(:options) { { env: { 'HTTP_HOST' => 'http://locomotive.works:8080' } } }

    subject { described_class.new(site, options) }
    let(:exposure) { subject.serializable_hash }

    describe 'content_version' do
      it 'returns the content version (integer)' 

    end

    describe 'template_version' do
      it 'returns the template version (integer)' 

    end

    describe 'timezones' do
      it 'returns the timezone name' 

    end

    describe 'memberships' do
      it 'returns an array of memberships' 

    end

    describe 'preview_url' do
      it 'returns the url to preview the site' 

    end

    describe 'sign_in_url' do
      it 'returns the url to sign in to the site' 

    end
  end

end

