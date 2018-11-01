# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::StreamingController do
  around(:each) do |example|
    before = Rails.configuration.x.streaming_api_base_url
    Rails.configuration.x.streaming_api_base_url = Rails.configuration.x.web_domain
    example.run
    Rails.configuration.x.streaming_api_base_url = before
  end

  before(:each) do
    request.headers.merge! Host: Rails.configuration.x.web_domain
  end

  context 'with streaming api on same host' do
    describe 'GET #index' do
      it 'raises ActiveRecord::RecordNotFound' 

    end
  end

  context 'with streaming api on different host' do
    before(:each) do
      Rails.configuration.x.streaming_api_base_url = 'wss://streaming-' + Rails.configuration.x.web_domain
      @streaming_host = URI.parse(Rails.configuration.x.streaming_api_base_url).host
    end

    describe 'GET #index' do
      it 'redirects to streaming host' 

    end
  end
end

