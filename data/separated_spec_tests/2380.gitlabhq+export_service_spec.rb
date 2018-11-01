require 'spec_helper'

describe Projects::ImportExport::ExportService do
  describe '#execute' do
    let!(:user) { create(:user) }
    let(:project) { create(:project) }
    let(:shared) { project.import_export_shared }
    let(:service) { described_class.new(project, user) }
    let!(:after_export_strategy) { Gitlab::ImportExport::AfterExportStrategies::DownloadNotificationStrategy.new }

    it 'saves the version' 


    it 'saves the avatar' 


    it 'saves the models' 


    it 'saves the uploads' 


    it 'saves the repo' 


    it 'saves the lfs objects' 


    it 'saves the wiki repo' 


    context 'when all saver services succeed' do
      before do
        allow(service).to receive(:save_services).and_return(true)
      end

      it 'saves the project in the file system' 


      it 'calls the after export strategy' 


      context 'when after export strategy fails' do
        before do
          allow(after_export_strategy).to receive(:execute).and_return(false)
        end

        after do
          service.execute(after_export_strategy)
        end

        it 'removes the remaining exported data' 


        it 'notifies the user' 


        it 'notifies logger' 

      end
    end

    context 'when saver services fail' do
      before do
        allow(service).to receive(:save_services).and_return(false)
      end

      after do
        expect { service.execute }.to raise_error(Gitlab::ImportExport::Error)
      end

      it 'removes the remaining exported data' 


      it 'notifies the user' 


      it 'notifies logger' 


      it 'the after export strategy is not called' 

    end
  end
end

