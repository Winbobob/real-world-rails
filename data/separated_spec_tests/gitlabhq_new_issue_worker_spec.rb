require 'spec_helper'

describe NewIssueWorker do
  describe '#perform' do
    let(:worker) { described_class.new }

    context 'when an issue not found' do
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
      let(:issue) { create(:issue, project: project, description: "issue for #{mentioned.to_reference}") }

      it 'creates a new event record' 


      it 'creates a notification for the mentioned user' 

    end
  end
end

