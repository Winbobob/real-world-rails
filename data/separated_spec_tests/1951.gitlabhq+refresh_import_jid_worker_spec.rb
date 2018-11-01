require 'spec_helper'

describe Gitlab::GithubImport::RefreshImportJidWorker do
  let(:worker) { described_class.new }

  describe '.perform_in_the_future' do
    it 'schedules a job in the future' 

  end

  describe '#perform' do
    let(:project) { create(:project) }
    let(:import_state) { create(:import_state, project: project, jid: '123abc') }

    context 'when the project does not exist' do
      it 'does nothing' 

    end

    context 'when the job is running' do
      it 'refreshes the import JID and reschedules itself' 

    end

    context 'when the job is no longer running' do
      it 'returns' 

    end
  end

  describe '#find_project' do
    it 'returns a Project' 


    # it 'only selects the import JID field' do
    #   project = create(:project, :import_started)
    #   project.import_state.update_attributes(jid: '123abc')
    #
    #   expect(worker.find_project(project.id).attributes)
    #     .to eq({ 'id' => nil, 'import_jid' => '123abc' })
    # end

    it 'returns nil for a project for which the import process failed' 


    it 'returns nil for a non-existing project' 

  end
end

