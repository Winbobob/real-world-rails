require 'spec_helper'

describe Issues::CloseService do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:guest) { create(:user) }
  let(:issue) { create(:issue, assignees: [user2], author: create(:user)) }
  let(:project) { issue.project }
  let!(:todo) { create(:todo, :assigned, user: user, project: project, target: issue, author: user2) }

  before do
    project.add_maintainer(user)
    project.add_developer(user2)
    project.add_guest(guest)
  end

  describe '#execute' do
    let(:service) { described_class.new(project, user) }

    it 'checks if the user is authorized to update the issue' 


    it 'does not close the issue when the user is not authorized to do so' 


    it 'closes the issue when the user is authorized to do so' 


    it 'refreshes the number of open issues', :use_clean_rails_memory_store_caching do
      expect { service.execute(issue) }
        .to change { project.open_issues_count }.from(1).to(0)
    end

    it 'invalidates counter cache for assignees' 

  end

  describe '#close_issue' do
    context "valid params" do
      before do
        perform_enqueued_jobs do
          described_class.new(project, user).close_issue(issue)
        end
      end

      it 'closes the issue' 


      it 'records closed user' 


      it 'sends email to user2 about assign of new issue' 


      it 'creates system note about issue reassign' 


      it 'marks todos as done' 

    end

    context 'when issue is not confidential' do
      it 'executes issue hooks' 

    end

    context 'when issue is confidential' do
      it 'executes confidential issue hooks' 

    end

    context 'internal issues disabled' do
      before do
        project.issues_enabled = false
        project.save!
      end

      it 'does not close the issue' 

    end
  end
end

