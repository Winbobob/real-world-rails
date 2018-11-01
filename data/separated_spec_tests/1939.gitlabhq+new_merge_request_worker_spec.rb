require 'spec_helper'

describe NewMergeRequestWorker do
  describe '#perform' do
    let(:worker) { described_class.new }

    context 'when a merge request not found' do
      it 'does not call Services' 


      it 'logs an error' 

    end

    context 'when a user not found' do
      it 'does not call Services' 


      it 'logs an error' 

    end

    context 'when everything is ok' do
      let(:project) { create(:project, :public) }
      let(:mentioned) { create(:user) }
      let(:user) { create(:user) }
      let(:merge_request) do
        create(:merge_request, source_project: project, description: "mr for #{mentioned.to_reference}")
      end

      it 'creates a new event record' 


      it 'creates a notification for the mentioned user' 

    end
  end
end

