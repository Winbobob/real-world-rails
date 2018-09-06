require 'spec_helper'

describe Gitlab::GithubImport::Stage::ImportIssuesAndDiffNotesWorker do
  let(:project) { create(:project) }
  let(:worker) { described_class.new }

  describe '#import' do
    it 'imports the issues and diff notes' 

  end
end

