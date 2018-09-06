require 'spec_helper'

describe Gitlab::GithubImport::ReschedulingMethods do
  let(:worker) do
    Class.new { include(Gitlab::GithubImport::ReschedulingMethods) }.new
  end

  describe '#perform' do
    context 'with a non-existing project' do
      it 'does not perform any work' 


      it 'notifies any waiters so they do not wait forever' 

    end

    context 'with an existing project' do
      let(:project) { create(:project) }

      it 'notifies any waiters upon successfully importing the data' 


      it 'reschedules itself if the data could not be imported' 

    end
  end

  describe '#try_import' do
    it 'returns true when the import succeeds' 


    it 'returns false when the import fails due to hitting the GitHub API rate limit' 

  end

  describe '#notify_waiter' do
    it 'notifies the waiter if a waiter key is specified' 


    it 'does not notify any waiters if no waiter key is specified' 

  end
end

