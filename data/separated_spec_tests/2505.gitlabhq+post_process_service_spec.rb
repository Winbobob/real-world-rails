require 'spec_helper'

describe Notes::PostProcessService do
  let(:project) { create(:project) }
  let(:issue) { create(:issue, project: project) }
  let(:user) { create(:user) }

  describe '#execute' do
    before do
      project.add_maintainer(user)
      note_opts = {
        note: 'Awesome comment',
        noteable_type: 'Issue',
        noteable_id: issue.id
      }

      @note = Notes::CreateService.new(project, user, note_opts).execute
    end

    it do
      expect(project).to receive(:execute_hooks)
      expect(project).to receive(:execute_services)

      described_class.new(@note).execute
    end

    context 'with a confidential issue' do
      let(:issue) { create(:issue, :confidential, project: project) }

      it "doesn't call note hooks/services" 


      it "calls confidential-note hooks/services" 

    end
  end
end

