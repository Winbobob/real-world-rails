require 'spec_helper'

describe Projects::MirrorsController do
  include ReactiveCachingHelpers

  describe 'setting up a remote mirror' do
    set(:project) { create(:project, :repository) }

    context 'when the current project is not a mirror' do
      it 'allows to create a remote mirror' 

    end
  end

  describe '#update' do
    let(:project) { create(:project, :repository, :remote_mirror) }

    before do
      sign_in(project.owner)
    end

    around do |example|
      Sidekiq::Testing.fake! { example.run }
    end

    context 'With valid URL for a push' do
      let(:remote_mirror_attributes) do
        { "0" => { "enabled" => "0", url: 'https://updated.example.com' } }
      end

      it 'processes a successful update' 


      it 'should create a RemoteMirror object' 

    end

    context 'With invalid URL for a push' do
      let(:remote_mirror_attributes) do
        { "0" => { "enabled" => "0", url: 'ftp://invalid.invalid' } }
      end

      it 'processes an unsuccessful update' 


      it 'should not create a RemoteMirror object' 

    end
  end

  describe '#ssh_host_keys', :use_clean_rails_memory_store_caching do
    let(:project) { create(:project) }
    let(:cache) { SshHostKey.new(project: project, url: "ssh://example.com:22") }

    before do
      sign_in(project.owner)
    end

    context 'invalid URLs' do
      %w[
        INVALID
        git@example.com:foo/bar.git
        ssh://git@example.com:foo/bar.git
      ].each do |url|
        it "returns an error with a 400 response for URL #{url.inspect}" 

      end
    end

    context 'no data in cache' do
      it 'requests the cache to be filled and returns a 204 response' 

    end

    context 'error in the cache' do
      it 'returns the error with a 400 response' 

    end

    context 'data in the cache' do
      let(:ssh_key) { 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf' }
      let(:ssh_fp) { { type: 'ed25519', bits: 256, fingerprint: '2e:65:6a:c8:cf:bf:b2:8b:9a:bd:6d:9f:11:5c:12:16', index: 0 } }

      it 'returns the data with a 200 response' 

    end

    def do_get(project, url = 'ssh://example.com')
      get :ssh_host_keys, namespace_id: project.namespace, project_id: project, ssh_url: url
    end
  end

  def do_put(project, options, extra_attrs = {})
    attrs = extra_attrs.merge(namespace_id: project.namespace.to_param, project_id: project.to_param)
    attrs[:project] = options

    put :update, attrs
  end
end

