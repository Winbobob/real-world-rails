require 'spec_helper'

describe Gitlab::GithubImport::Stage::ImportBaseDataWorker do
  let(:project) { create(:project) }
  let(:worker) { described_class.new }

  describe '#import' do
    it 'imports the base data of a project' 

  end
end

