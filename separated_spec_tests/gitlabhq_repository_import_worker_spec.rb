require 'spec_helper'

describe RepositoryImportWorker do
  describe 'modules' do
    it 'includes ProjectImportOptions' 

  end

  describe '#perform' do
    let(:project) { create(:project, :import_scheduled) }

    context 'when worker was reset without cleanup' do
      it 'imports the project successfully' 

    end

    context 'when the import was successful' do
      it 'imports a project' 

    end

    context 'when the import has failed' do
      it 'hide the credentials that were used in the import URL' 


      it 'updates the error on Import/Export' 

    end

    context 'when using an asynchronous importer' do
      it 'does not mark the import process as finished' 

    end
  end
end

