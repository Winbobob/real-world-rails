require 'spec_helper'

describe Issues::ReopenService do
  let(:project) { create(:project) }
  let(:issue) { create(:issue, :closed, project: project) }

  describe '#execute' do
    context 'when user is not authorized to reopen issue' do
      before do
        guest = create(:user)
        project.add_guest(guest)

        perform_enqueued_jobs do
          described_class.new(project, guest).execute(issue)
        end
      end

      it 'does not reopen the issue' 

    end

    context 'when user is authorized to reopen issue' do
      let(:user) { create(:user) }

      before do
        project.add_maintainer(user)
      end

      it 'invalidates counter cache for assignees' 


      it 'refreshes the number of opened issues' 


      context 'when issue is not confidential' do
        it 'executes issue hooks' 

      end

      context 'when issue is confidential' do
        it 'executes confidential issue hooks' 

      end
    end
  end
end

