require 'spec_helper'

describe Gitlab::GithubImport::Stage::FinishImportWorker do
  let(:project) { create(:project) }
  let(:worker) { described_class.new }

  describe '#perform' do
    it 'marks the import as finished' 

  end

  describe '#report_import_time' do
    it 'reports the total import time' 

  end
end

