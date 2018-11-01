# frozen_string_literal: true

require 'rails_helper'

describe 'Confirmation Reminder' do
  let(:client) { double }

  before do
    allow(Aws::SNS::Client).to receive(:new) { client }
    allow(client).to receive(:publish)
  end

  let(:page) { create(:page, language: create(:language, :german)) }

  context 'action remains unconfirmed 24 hours later' do
    it 'finds and sends repeat email if member has not given consent' 


    it 'does nothing if consented member already exists' 


    it 'returns 402 if not authorized' 

  end
end

describe 'New Action Confirmation' do
  let(:page) { create(:page, title: 'Foo Bar', slug: 'foo-bar', language: create(:language, :german)) }
  let(:form) { create(:form_with_email_and_optional_country) }

  let(:params) do
    {
      email:    'hello@example.com',
      form_id:  form.id,
      page_id: page.id,
      source:   'fb',
      country:  'DE',
      name: 'John Doe'
    }
  end

  let!(:pending_action) { create(:pending_action, data: params, token: '1234') }

  describe 'with consent' do
    before do
      allow(ActionQueue::Pusher).to receive(:push)
    end

    it 'sets confimed_at on pending action' 


    it 'posts to queue' 


    it 'creates action and member' 


    it 'sets consented to true on pending action' 


    it 'stores member_id to cookie' 

  end

  describe 'without consent' do
    before do
      allow(ActionQueue::Pusher).to receive(:push)
    end

    it 'does not post to queue' 


    it 'sets confimed_at on pending action' 


    it 'sets consented to false on pending action' 


    it 'creates action without a member' 

  end
end

