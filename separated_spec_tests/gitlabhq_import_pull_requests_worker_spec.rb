require 'spec_helper'

describe Gitlab::GithubImport::Stage::ImportPullRequestsWorker do
  let(:project) { create(:project) }
  let(:worker) { described_class.new }

  describe '#import' do
    it 'imports all the pull requests' 

  end
end

