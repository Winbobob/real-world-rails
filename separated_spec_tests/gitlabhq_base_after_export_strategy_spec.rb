require 'spec_helper'

describe Gitlab::ImportExport::AfterExportStrategies::BaseAfterExportStrategy do
  let!(:service) { described_class.new }
  let!(:project) { create(:project, :with_export) }
  let(:shared) { project.import_export_shared }
  let!(:user) { create(:user) }

  describe '#execute' do
    before do
      allow(service).to receive(:strategy_execute)
    end

    it 'returns if project exported file is not found' 


    it 'creates a lock file in the export dir' 


    context 'when the method succeeds' do
      it 'removes the lock file' 

    end

    context 'when the method fails' do
      before do
        allow(service).to receive(:strategy_execute).and_call_original
      end

      context 'when validation fails' do
        before do
          allow(service).to receive(:invalid?).and_return(true)
        end

        it 'does not create the lock file' 


        it 'does not execute main logic' 


        it 'logs validation errors in shared context' 

      end

      context 'when an exception is raised' do
        it 'removes the lock' 

      end
    end
  end

  describe '#log_validation_errors' do
    it 'add the message to the shared context' 

  end

  describe '#to_json' do
    it 'adds the current strategy class to the serialized attributes' 

  end

  def lock_path_exist?
    File.exist?(described_class.lock_file_path(project))
  end
end

