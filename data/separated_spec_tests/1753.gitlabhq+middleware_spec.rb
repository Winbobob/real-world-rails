require 'spec_helper'

describe Gitlab::EtagCaching::Middleware do
  let(:app) { double(:app) }
  let(:middleware) { described_class.new(app) }
  let(:app_status_code) { 200 }
  let(:if_none_match) { nil }
  let(:enabled_path) { '/gitlab-org/gitlab-ce/noteable/issue/1/notes' }

  context 'when ETag caching is not enabled for current route' do
    let(:path) { '/gitlab-org/gitlab-ce/tree/master/noteable/issue/1/notes' }

    before do
      mock_app_response
    end

    it 'does not add ETag header' 


    it 'passes status code from app' 

  end

  context 'when there is no ETag in store for given resource' do
    let(:path) { enabled_path }

    before do
      mock_app_response
      mock_value_in_store(nil)
    end

    it 'generates ETag' 


    context 'when If-None-Match header was specified' do
      let(:if_none_match) { 'W/"abc"' }

      it 'tracks "etag_caching_key_not_found" event' 

    end
  end

  context 'when there is ETag in store for given resource' do
    let(:path) { enabled_path }

    before do
      mock_app_response
      mock_value_in_store('123')
    end

    it 'returns this value as header' 

  end

  context 'when If-None-Match header matches ETag in store' do
    let(:path) { enabled_path }
    let(:if_none_match) { 'W/"123"' }

    before do
      mock_value_in_store('123')
    end

    it 'does not call app' 


    it 'returns status code 304' 


    it 'returns empty body' 


    it 'tracks "etag_caching_cache_hit" event' 


    context 'when polling is disabled' do
      before do
        allow(Gitlab::PollingInterval).to receive(:polling_enabled?)
          .and_return(false)
      end

      it 'returns status code 429' 

    end
  end

  context 'when If-None-Match header does not match ETag in store' do
    let(:path) { enabled_path }
    let(:if_none_match) { 'W/"abc"' }

    before do
      mock_value_in_store('123')
    end

    it 'calls app' 


    it 'tracks "etag_caching_resource_changed" event' 

  end

  context 'when If-None-Match header is not specified' do
    let(:path) { enabled_path }

    before do
      mock_value_in_store('123')
      mock_app_response
    end

    it 'tracks "etag_caching_header_missing" event' 

  end

  context 'when GitLab instance is using a relative URL' do
    before do
      mock_app_response
    end

    it 'uses full path as cache key' 

  end

  def mock_app_response
    allow(app).to receive(:call).and_return([app_status_code, {}, ['body']])
  end

  def mock_value_in_store(value)
    allow_any_instance_of(Gitlab::EtagCaching::Store)
      .to receive(:get).and_return(value)
  end

  def build_request(path, if_none_match)
    { 'PATH_INFO' => path, 'HTTP_IF_NONE_MATCH' => if_none_match }
  end
end

