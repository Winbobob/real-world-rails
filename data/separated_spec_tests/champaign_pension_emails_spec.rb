# frozen_string_literal: true

require 'rails_helper'

describe 'Pension Emails', type: :request do
  let(:aws_client) { double(:aws_client, put_item: true) }
  let(:akid) { '25429.9032842.RNP4O4' }

  before do
    allow(ChampaignQueue).to receive(:push)
    allow(Aws::DynamoDB::Client).to receive(:new) { aws_client }
    allow(aws_client).to receive(:put_item) { true }
  end

  describe 'POST#create' do
    let(:page) { create(:page, title: 'Foo Bar', slug: 'foo-bar') }
    let(:registered_email) { create(:registered_email_address) }
    let!(:plugin) { create(:email_pension, page: page, from_email_address: registered_email) }

    let(:params) do
      {
        page_slug: 'foo-bar',
        from_name: "Sender's Name",
        from_email: 'sender@example.com',
        to_name: "Target's Name",
        to_email: 'recipient@example.com',
        body: 'Body text',
        target_name: 'Target name',
        country: 'GB',
        subject: 'Subject',
        akid: akid,
        source: 'fb'
      }
    end

    before do
      post "/api/pages/#{page.id}/pension_emails", params: params
    end

    it 'saves email to dynamodb' 


    it 'creates an action and member' 


    it 'posts action to queue' 

  end
end

