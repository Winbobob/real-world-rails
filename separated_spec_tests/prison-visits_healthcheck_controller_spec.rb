require 'rails_helper'

RSpec.describe HealthcheckController, type: :controller do
  render_views

  let(:key) { 'super secret' }

  around do |example|
    original = Rails.configuration.trusted_users_access_key
    Rails.configuration.trusted_users_access_key = key
    example.call
    Rails.configuration.trusted_users_access_key = original
  end

  let(:parsed_body) {
    JSON.parse(response.body)
  }

  let(:healthcheck) {
    double(
      Healthcheck,
      ok?: true,
      checks: {
        database: {
          description: "Postgres database", ok: true
        },
        mailers: {
          description: "Email queue", ok: true,
          oldest: nil, count: 0
        },
        zendesk: {
          description: "Zendesk queue", ok: true,
          oldest: nil, count: 0
        },
        ok: true
      }
    )
  }

  before do
    allow(Healthcheck).to receive(:new).and_return(healthcheck)
  end

  context 'with an invalid key' do
    it 'rejects unauthenticated access' 

  end

  context 'when everything is OK' do
    before do
      get :index, key: key
    end

    it 'returns an HTTP Success status' 


    it 'returns the healthcheck data as JSON' 

  end

  context 'when the healthcheck is not OK' do
    before do
      allow(healthcheck).to receive(:ok?).and_return(false)
      get :index, key: key
    end

    it 'returns an HTTP Bad Gateway status' 

  end

  context 'when there are no queue items' do
    before do
      get :index, key: key
    end

    it 'reports empty queue statuses' 

  end

  context 'when there are queue items' do
    let(:mq_created_at) { Time.at(1440685647).utc }
    let(:zq_created_at) { Time.at(1440685724).utc }

    before do
      allow(healthcheck).to receive(:checks).and_return(
        database: {
          description: "Postgres database", ok: true
        },
        mailers: {
          description: "Email queue", ok: true,
          oldest: mq_created_at, count: 1
        },
        zendesk: {
          description: "Zendesk queue", ok: true,
          oldest: zq_created_at, count: 2
        },
        ok: true
      )
      get :index, key: key
    end

    it 'reports timestamps in RFC 3339 format' 

  end
end

