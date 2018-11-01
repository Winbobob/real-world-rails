# frozen_string_literal: true

require 'rails_helper'

describe 'Api Actions' do
  let(:sqs_client) { double }

  before do
    allow(ChampaignQueue).to receive(:push)
  end

  let(:page) { create(:page,  title: 'Foo Bar') }
  let(:form) { create(:form_with_email) }

  let(:headers) do
    {
      'HTTP_ACCEPT'           => '*/*',
      'HTTP_ACCEPT_LANGUAGE'  => 'en',
      'HTTP_ACCEPT_ENCODING'  => '*',
      'HTTP_USER_AGENT'       => 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D257',
      'referer'               => 'www.google.com'
    }
  end

  describe 'POST#create' do
    let(:page) { create(:page, title: 'Foo Bar', slug: 'foo-bar') }
    let(:form) { create(:form_with_email_and_optional_country) }

    let(:params) do
      {
        email:    'hello@example.com',
        form_id:  form.id,
        source:   'fb',
        country:  'FR',
        consented: 'true',
        akid:     '1234.5678.tKK7gX',
        referring_akid: '1234.5678.tKK7gX',
        name: 'Bob Mash'
      }
    end

    let(:message_body) do
      {
        type: 'action',
        meta: hash_including(title:      'Foo Bar',
                             uri:        '/a/foo-bar',
                             slug:       'foo-bar',
                             first_name: 'Bob',
                             last_name:  'Mash',
                             created_at: be_within(1.second).of(Time.zone.now),
                             country: 'France',
                             subscribed_member: true,
                             action_id: instance_of(Integer)),

        params: hash_including(page:    'foo-bar-petition',
                               email:  'hello@example.com',
                               name:   'Bob Mash',
                               page_id: page.id.to_s,
                               form_id: form.id.to_s,
                               source: 'fb',
                               akid:   '1234.5678.tKK7gX',
                               referring_akid: '1234.5678.tKK7gX',
                               action_mobile: 'mobile',
                               action_referer: 'www.google.com',
                               user_en: 1)
      }
    end

    describe 'with extra action fields' do
      let(:_params) {
        params.merge extra_action_fields: {
          action_test_variant: 'test_variant_name'
        }
      }
      it 'creates an action with the extra action fields' 

    end

    describe 'queue' do
      before do
        post "/api/pages/#{page.id}/actions", params: params, headers: headers
      end

      it 'pushes action to queue' 

    end

    ## TODO: Over testing... Should be a unit test
    #
    describe 'edge case country names' do
      CountriesExtension::COUNTRIES.each do |code, name|
        it "successfully posts #{name}" 

      end
    end

    describe 'existing action' do
      let!(:member) { create :member, actionkit_user_id: '7777', email: params[:email] }
      let(:page2) { create :page }

      subject { post "/api/pages/#{page.id}/actions", params: params }

      it 'creates a new action if existing action on a different page' 


      it 'does not create an action if existing action on this page' 


      it 'does not create an action if existing action of different page in same campaign' 

    end

    describe 'page allows duplicate actions' do
      let!(:member) { create :member, actionkit_user_id: '7777', email: params[:email] }

      before do
        page.update(allow_duplicate_actions: true)
      end

      subject { post "/api/pages/#{page.id}/actions", params: params }

      it 'creats an action if existing action on this page' 

    end

    describe 'akid manipulation' do
      context 'new member' do
        before do
          post "/api/pages/#{page.id}/actions", params: params
        end

        it 'persists action' 


        it 'saves akid on action' 


        it 'saves actionkit_user_id on member' 

      end

      context 'existing member' do
        let!(:member) { create :member, actionkit_user_id: '7777', email: params[:email] }

        it 'overwrites existing actionkit_user_id' 

      end
    end
  end

  # TODO: Over testing. This should be a unit test.
  #
  ['long_string_with_underscore', '1234.5678', '2', '?&=', '2..2', '..2'].each do |invalid_akid|
    describe "invalid akid '#{invalid_akid}'" do
      let(:params) do
        {
          email: 'hello@example.com',
          form_id: form.id,
          akid: invalid_akid
        }
      end

      context 'existing member' do
        let!(:member) { create :member, actionkit_user_id: '1234', email: params[:email] }

        it 'does not overwrite existing actionkit_user_id' 

      end

      context 'new member' do
        before do
          post "/api/pages/#{page.id}/actions", params: params
        end

        it 'responds with success' 


        it 'does not assign an actionkit_user_id to the created Member' 


        it 'sends the bad akid through the form data for record keeping' 


        it 'does not include a referring_user_uri in the queue message' 

      end
    end
  end
end

