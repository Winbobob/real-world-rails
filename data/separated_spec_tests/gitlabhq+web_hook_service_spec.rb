require 'spec_helper'

describe WebHookService do
  let(:project) { create(:project) }
  let(:project_hook) { create(:project_hook) }
  let(:headers) do
    {
      'Content-Type' => 'application/json',
      'X-Gitlab-Event' => 'Push Hook'
    }
  end
  let(:data) do
    { before: 'oldrev', after: 'newrev', ref: 'ref' }
  end
  let(:service_instance) { described_class.new(project_hook, data, :push_hooks) }

  describe '#initialize' do
    it 'allow_local_requests is true if hook is a SystemHook' 


    it 'allow_local_requests is false if hook is not a SystemHook' 

  end

  describe '#execute' do
    before do
      project.hooks << [project_hook]

      WebMock.stub_request(:post, project_hook.url)
    end

    context 'when token is defined' do
      let(:project_hook) { create(:project_hook, :token) }

      it 'POSTs to the webhook URL' 

    end

    it 'POSTs to the webhook URL' 


    it 'POSTs the data as JSON' 


    context 'when auth credentials are present' do
      let(:url)  {'https://example.org'}
      let(:project_hook) { create(:project_hook, url: 'https://demo:demo@example.org/') }

      it 'uses the credentials' 

    end

    context 'when auth credentials are partial present' do
      let(:url)  {'https://example.org'}
      let(:project_hook) { create(:project_hook, url: 'https://demo@example.org/') }

      it 'uses the credentials anyways' 

    end

    it 'catches exceptions' 


    it 'handles exceptions' 


    it 'handles 200 status code' 


    it 'handles 2xx status codes' 


    context 'execution logging' do
      let(:hook_log) { project_hook.web_hook_logs.last }

      context 'with success' do
        before do
          WebMock.stub_request(:post, project_hook.url).to_return(status: 200, body: 'Success')
          service_instance.execute
        end

        it 'log successful execution' 

      end

      context 'with exception' do
        before do
          WebMock.stub_request(:post, project_hook.url).to_raise(SocketError.new('Some HTTP Post error'))
          service_instance.execute
        end

        it 'log failed execution' 

      end

      context 'with unsafe response body' do
        before do
          WebMock.stub_request(:post, project_hook.url).to_return(status: 200, body: "\xBB")
          service_instance.execute
        end

        it 'log successful execution' 

      end

      context 'should not log ServiceHooks' do
        let(:service_hook) { create(:service_hook) }
        let(:service_instance) { described_class.new(service_hook, data, 'service_hook') }

        before do
          WebMock.stub_request(:post, service_hook.url).to_return(status: 200, body: 'Success')
        end

        it { expect { service_instance.execute }.not_to change(WebHookLog, :count) }
      end
    end
  end

  describe '#async_execute' do
    let(:system_hook) { create(:system_hook) }

    it 'enqueue WebHookWorker' 

  end
end

