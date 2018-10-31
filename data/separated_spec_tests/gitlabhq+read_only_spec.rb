require 'spec_helper'

describe Gitlab::Middleware::ReadOnly do
  include Rack::Test::Methods
  using RSpec::Parameterized::TableSyntax

  let(:rack_stack) do
    rack = Rack::Builder.new do
      use ActionDispatch::Session::CacheStore
      use ActionDispatch::Flash
      use ActionDispatch::ParamsParser
    end

    rack.run(subject)
    rack.to_app
  end

  let(:observe_env) do
    Module.new do
      attr_reader :env

      def call(env)
        @env = env
        super
      end
    end
  end

  let(:request) { Rack::MockRequest.new(rack_stack) }

  subject do
    described_class.new(fake_app).tap do |app|
      app.extend(observe_env)
    end
  end

  context 'normal requests to a read-only GitLab instance' do
    let(:fake_app) { lambda { |env| [200, { 'Content-Type' => 'text/plain' }, ['OK']] } }

    before do
      allow(Gitlab::Database).to receive(:read_only?) { true }
    end

    it 'expects PATCH requests to be disallowed' 


    it 'expects PUT requests to be disallowed' 


    it 'expects POST requests to be disallowed' 


    it 'expects a internal POST request to be allowed after a disallowed request' 


    it 'expects DELETE requests to be disallowed' 


    it 'expects POST of new file that looks like an LFS batch url to be disallowed' 


    it 'returns last_vistited_url for disallowed request' 


    context 'whitelisted requests' do
      it 'expects a POST internal request to be allowed' 


      it 'expects requests to sidekiq admin to be allowed' 


      where(:description, :path) do
        'LFS request to batch'        | '/root/rouge.git/info/lfs/objects/batch'
        'LFS request to locks verify' | '/root/rouge.git/info/lfs/locks/verify'
        'LFS request to locks create' | '/root/rouge.git/info/lfs/locks'
        'LFS request to locks unlock' | '/root/rouge.git/info/lfs/locks/1/unlock'
        'request to git-upload-pack'  | '/root/rouge.git/git-upload-pack'
        'request to git-receive-pack' | '/root/rouge.git/git-receive-pack'
      end

      with_them do
        it "expects a POST #{description} URL to be allowed" 

      end
    end
  end

  context 'json requests to a read-only GitLab instance' do
    let(:fake_app) { lambda { |env| [200, { 'Content-Type' => 'application/json' }, ['OK']] } }
    let(:content_json) { { 'CONTENT_TYPE' => 'application/json' } }

    before do
      allow(Gitlab::Database).to receive(:read_only?) { true }
    end

    it 'expects PATCH requests to be disallowed' 


    it 'expects PUT requests to be disallowed' 


    it 'expects POST requests to be disallowed' 


    it 'expects DELETE requests to be disallowed' 

  end
end

