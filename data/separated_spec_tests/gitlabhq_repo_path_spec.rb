require 'spec_helper'

describe ::Gitlab::RepoPath do
  describe '.parse' do
    set(:project) { create(:project, :repository) }

    context 'a repository storage path' do
      it 'parses a full repository path' 


      it 'parses a full wiki path' 

    end

    context 'a relative path' do
      it 'parses a relative repository path' 


      it 'parses a relative wiki path' 


      it 'parses a relative path starting with /' 


      context 'of a redirected project' do
        let(:redirect) { project.route.create_redirect('foo/bar') }

        it 'parses a relative repository path' 


        it 'parses a relative wiki path' 


        it 'parses a relative path starting with /' 

      end
    end
  end

  describe '.strip_storage_path' do
    before do
      allow(Gitlab.config.repositories).to receive(:storages).and_return({
        'storage1' => Gitlab::GitalyClient::StorageSettings.new('path' => '/foo'),
        'storage2' => Gitlab::GitalyClient::StorageSettings.new('path' => '/bar')
      })
    end

    it 'strips the storage path' 


    it 'raises NotFoundError if no storage matches the path' 

  end

  describe '.find_project' do
    let(:project) { create(:project) }
    let(:redirect) { project.route.create_redirect('foo/bar/baz') }

    context 'when finding a project by its canonical path' do
      context 'when the cases match' do
        it 'returns the project and false' 

      end

      context 'when the cases do not match' do
        # This is slightly different than web behavior because on the web it is
        # easy and safe to redirect someone to the correctly-cased URL. For git
        # requests, we should accept wrongly-cased URLs because it is a pain to
        # block people's git operations and force them to update remote URLs.
        it 'returns the project and false' 

      end
    end

    context 'when finding a project via a redirect' do
      it 'returns the project and true' 

    end
  end
end

