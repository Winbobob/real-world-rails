require 'rails_helper'

RSpec.describe 'Requests for pages when we do not support the format on that page', type: :request, show_exceptions: true do

  let(:petition) { FactoryBot.create :open_petition }

  before do
    FactoryBot.create(:parliament, :archived)
  end

  shared_examples 'a route that only supports html formats' do |headers_only: false|
    unless headers_only
      it 'does not support json via extension' 


      it 'does not support xml via extension' 

    end

    it 'supports html' 


    it 'does not support json via accepts header' 


    it 'does not support xml via accepts header' 

  end

  shared_examples 'a route that supports html and json formats' do |headers_only: false|
    unless headers_only
      it 'supports json via extension' 


      it 'does not support xml via extension' 

    end

    it 'supports html' 


    it 'supports json via accepts header' 


    it 'does not support xml via accepts header' 

  end

  shared_examples 'a route that supports html, json and csv formats' do |headers_only: false|
    unless headers_only
      it 'supports json via extension' 


      it 'supports csv via extension' 


      it 'does not support xml via extension' 

    end

    it 'supports html' 


    it 'supports json via accepts header' 


    it 'supports csv via accepts header' 


    it 'does not support xml via accepts header' 

  end

  shared_examples 'a POST route where failure only supports html formats' do
    around do |example|
      begin
        ActionController::Base.allow_forgery_protection = false
        example.call
      ensure
        ActionController::Base.allow_forgery_protection = true
      end
    end

    it 'does not support json via extension' 


    it 'does not support xml via extension' 


    it 'supports html' 


    it 'does not support json via accepts header' 


    it 'does not support xml via accepts header' 

  end

  context 'the root url' do
    let(:url) { '/' }
    let(:params) { {} }

    it_behaves_like 'a route that only supports html formats', headers_only: true
  end

  simple_html_only_urls = [
    'help', 'privacy', 'feedback', 'feedback/thanks', 'petitions/local',
    'petitions/check', 'petitions/check_results', 'petitions/new'
  ]
  simple_html_only_urls.each do |simple_url|
    context "the #{simple_url} url" do
      let(:url) { "/#{simple_url}" }
      let(:params) { {} }

      it_behaves_like 'a route that only supports html formats'
    end
  end

  context "the petitions url" do
    let(:url) { "/petitions" }
    let(:params) { {} }

    it_behaves_like 'a route that supports html, json and csv formats'
  end

  context "the archived/petitions url" do
    let(:url) { "/archived/petitions" }
    let(:params) { {} }

    it_behaves_like 'a route that supports html and json formats'
  end

  context 'the petitions/local results url' do
    let(:url) { "/petitions/local/#{constituency.slug}" }
    let(:constituency) { FactoryBot.create(:constituency) }
    let(:params) { {} }

    it_behaves_like 'a route that supports html, json and csv formats'
  end

  context 'the petitions/local/all results url' do
    let(:url) { "/petitions/local/#{constituency.slug}/all" }
    let(:constituency) { FactoryBot.create(:constituency) }
    let(:params) { {} }

    it_behaves_like 'a route that supports html, json and csv formats'
  end

  context 'the petitions show url' do
    let(:url) { "/petitions/#{petition.id}" }
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:params) { {} }

    it_behaves_like 'a route that supports html and json formats'
  end

  context 'the petitions/thank-you url' do
    let(:url) { "/petitions/#{petition.id}/thank-you" }
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:params) { {} }

    it_behaves_like 'a route that only supports html formats'
  end

  context 'the petitions/moderation-info url' do
    let(:url) { "/petitions/#{petition.id}/moderation-info" }
    let(:petition) { FactoryBot.create(:sponsored_petition) }
    let(:params) { {} }

    it_behaves_like 'a route that only supports html formats'
  end

  context 'the petitions/sponsors/new url' do
    let(:url) { "/petitions/#{petition.id}/sponsors/new" }
    let(:petition) { FactoryBot.create(:pending_petition) }
    let(:params) {
      {
        'token' => petition.sponsor_token
      }
    }

    it_behaves_like 'a route that only supports html formats'
  end

  context 'the petitions/sponsors/thank-you url' do
    let(:url) { "/petitions/#{petition.id}/sponsors/thank-you" }
    let(:petition) { FactoryBot.create(:pending_petition) }
    let(:params) {
      {
        'token' => petition.sponsor_token
      }
    }

    it_behaves_like 'a route that only supports html formats'
  end

  context 'the sponsors/sponsored url' do
    let(:url) { "/sponsors/#{signature.id}/sponsored" }
    let(:petition) { FactoryBot.create(:pending_petition) }
    let(:signature) { FactoryBot.create(:sponsor, :validated, :just_signed, petition: petition) }
    let(:params) {
      {
        'token' => signature.perishable_token
      }
    }

    it_behaves_like 'a route that only supports html formats'
  end

  context 'the petitions/signatures/new url' do
    let(:url) { "/petitions/#{petition.id}/signatures/new" }
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:params) { {} }

    it_behaves_like 'a route that only supports html formats'
  end

  context 'the petitions/signatures/thank-you url' do
    let(:url) { "/petitions/#{petition.id}/signatures/thank-you" }
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:params) { {} }

    it_behaves_like 'a route that only supports html formats'
  end

  context 'the signatures/signed url' do
    let(:url) { "/signatures/#{signature.id}/signed" }
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:signature) { FactoryBot.create(:validated_signature, :just_signed, petition: petition) }
    let(:params) {
      {
        'token' => signature.perishable_token
      }
    }
    before do
      allow(Constituency).to receive(:find_by_postcode).and_return(nil)
    end

    it_behaves_like 'a route that only supports html formats'
  end

  # NOTE: we don't have a context for the signatures/verify url
  # because current implementation is that it *always* redirects, so no
  # content negotiation is required

  context 'the signatures/unsubscribe url' do
    let(:url) { "/signatures/#{signature.id}/unsubscribe" }
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:signature) { FactoryBot.create(:validated_signature, petition: petition) }
    let(:params) {
      {
        'token' => signature.unsubscribe_token
      }
    }

    it_behaves_like 'a route that only supports html formats'
  end

  context 'the archived/petitions show url' do
    let(:url) { "/archived/petitions/#{petition.id}" }
    let(:petition) { FactoryBot.create(:archived_petition) }
    let(:params) { {} }

    it_behaves_like 'a route that supports html and json formats'
  end

  context 'the browserconfig url' do
    let(:url) { '/browserconfig' }
    let(:params) { {} }

    it 'does not support json via extension' 


    it 'supports xml via extension' 


    it 'does not response without an extension' 

  end

  context 'the manifest url' do
    let(:url) { '/manifest' }
    let(:params) { {} }

    it 'does not support xml via extension' 


    it 'supports xml via extension' 


    it 'does not response without an extension' 

  end

  # NOTE: we only check failed posts for petitions/new, signatures/new, and
  # feedback because the success case will redirect and no content-negotiation
  # is required.
  context 'a failed post to petitions/new' do
    let(:url) { '/petitions/new' }
    let(:params) {
      {
        'stage' => 'replay-email',
        'move' => 'next',
        'petition' => {
          'background' => 'Limit temperature rise at two degrees',
          'additional_details' => 'Global warming is upon us',
          'creator' => {
            'name' => 'John Mcenroe', 'email' => 'john@example.com',
            'postcode' => 'SE3 4LL', 'location_code' => 'GB',
            'uk_citizenship' => '1'
          }
        }
      }
    }

    it_behaves_like 'a POST route where failure only supports html formats'
  end

  context 'a failed post to signatures/new' do
    let(:url) { "/petitions/#{petition.id}/signatures/new" }
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:params) {
      {
        'stage' => 'replay-email',
        'move' => 'next',
        'petition_id' => "#{petition.id}",
        'signature' => {
          'name' => 'John Mcenroe', 'email' => 'john@example.com',
          'postcode' => 'SE3 4LL', 'location_code' => 'GB'
        }
      }
    }

    it_behaves_like 'a POST route where failure only supports html formats'
  end

  context 'a failed post to feedback' do
    let(:url) { '/feedback' }
    let(:params) { {} }

    it_behaves_like 'a POST route where failure only supports html formats'
  end

  context 'the constituencies url' do
    let(:url) { '/constituencies' }
    let(:params) { {} }

    it 'supports json via extension' 


    it 'supports json via accepts header' 


    it 'does not support xml via extension' 


    it 'does not support xml via accepts header' 


    it 'does not support html via extension' 


    it 'does not support html via accepts header' 


    it 'does not support html default' 

  end
end

