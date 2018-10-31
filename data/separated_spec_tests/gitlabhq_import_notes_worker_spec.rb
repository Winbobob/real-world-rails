require 'spec_helper'

describe Gitlab::GithubImport::Stage::ImportNotesWorker do
  let(:project) { create(:project) }
  let(:worker) { described_class.new }

  describe '#import' do
    it 'imports all the notes' 

  end
end

