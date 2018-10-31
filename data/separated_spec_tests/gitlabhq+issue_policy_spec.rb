require 'spec_helper'

describe IssuePolicy do
  let(:guest) { create(:user) }
  let(:author) { create(:user) }
  let(:assignee) { create(:user) }
  let(:reporter) { create(:user) }
  let(:group) { create(:group, :public) }
  let(:reporter_from_group_link) { create(:user) }

  def permissions(user, issue)
    described_class.new(user, issue)
  end

  context 'a private project' do
    let(:non_member) { create(:user) }
    let(:project) { create(:project, :private) }
    let(:issue) { create(:issue, project: project, assignees: [assignee], author: author) }
    let(:issue_no_assignee) { create(:issue, project: project) }

    before do
      project.add_guest(guest)
      project.add_guest(author)
      project.add_guest(assignee)
      project.add_reporter(reporter)

      group.add_reporter(reporter_from_group_link)

      create(:project_group_link, group: group, project: project)
    end

    it 'does not allow non-members to read issues' 


    it 'allows guests to read issues' 


    it 'allows reporters to read, update, and admin issues' 


    it 'allows reporters from group links to read, update, and admin issues' 


    it 'allows issue authors to read and update their issues' 


    it 'allows issue assignees to read and update their issues' 


    context 'with confidential issues' do
      let(:confidential_issue) { create(:issue, :confidential, project: project, assignees: [assignee], author: author) }
      let(:confidential_issue_no_assignee) { create(:issue, :confidential, project: project) }

      it 'does not allow non-members to read confidential issues' 


      it 'does not allow guests to read confidential issues' 


      it 'allows reporters to read, update, and admin confidential issues' 


      it 'allows reporters from group links to read, update, and admin confidential issues' 


      it 'allows issue authors to read and update their confidential issues' 


      it 'allows issue assignees to read and update their confidential issues' 

    end
  end

  context 'a public project' do
    let(:project) { create(:project, :public) }
    let(:issue) { create(:issue, project: project, assignees: [assignee], author: author) }
    let(:issue_no_assignee) { create(:issue, project: project) }
    let(:issue_locked) { create(:issue, :locked, project: project, author: author, assignees: [assignee]) }

    before do
      project.add_guest(guest)
      project.add_reporter(reporter)

      group.add_reporter(reporter_from_group_link)

      create(:project_group_link, group: group, project: project)
    end

    it 'allows guests to read issues' 


    it 'allows reporters to read, update, reopen, and admin issues' 


    it 'allows reporters from group links to read, update, reopen and admin issues' 


    it 'allows issue authors to read, reopen and update their issues' 


    it 'allows issue assignees to read, reopen and update their issues' 


    context 'with confidential issues' do
      let(:confidential_issue) { create(:issue, :confidential, project: project, assignees: [assignee], author: author) }
      let(:confidential_issue_no_assignee) { create(:issue, :confidential, project: project) }

      it 'does not allow guests to read confidential issues' 


      it 'allows reporters to read, update, and admin confidential issues' 


      it 'allows reporter from group links to read, update, and admin confidential issues' 


      it 'allows issue authors to read and update their confidential issues' 


      it 'allows issue assignees to read and update their confidential issues' 

    end
  end
end

