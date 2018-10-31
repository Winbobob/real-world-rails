require 'spec_helper'

describe IssuesFinder do
  set(:user) { create(:user) }
  set(:user2) { create(:user) }
  set(:group) { create(:group) }
  set(:subgroup) { create(:group, parent: group) }
  set(:project1) { create(:project, group: group) }
  set(:project2) { create(:project) }
  set(:project3) { create(:project, group: subgroup) }
  set(:milestone) { create(:milestone, project: project1) }
  set(:label) { create(:label, project: project2) }
  set(:issue1) { create(:issue, author: user, assignees: [user], project: project1, milestone: milestone, title: 'gitlab', created_at: 1.week.ago, updated_at: 1.week.ago) }
  set(:issue2) { create(:issue, author: user, assignees: [user], project: project2, description: 'gitlab', created_at: 1.week.from_now, updated_at: 1.week.from_now) }
  set(:issue3) { create(:issue, author: user2, assignees: [user2], project: project2, title: 'tanuki', description: 'tanuki', created_at: 2.weeks.from_now, updated_at: 2.weeks.from_now) }
  set(:issue4) { create(:issue, project: project3) }
  set(:award_emoji1) { create(:award_emoji, name: 'thumbsup', user: user, awardable: issue1) }
  set(:award_emoji2) { create(:award_emoji, name: 'thumbsup', user: user2, awardable: issue2) }
  set(:award_emoji3) { create(:award_emoji, name: 'thumbsdown', user: user, awardable: issue3) }

  describe '#execute' do
    let!(:closed_issue) { create(:issue, author: user2, assignees: [user2], project: project2, state: 'closed') }
    let!(:label_link) { create(:label_link, label: label, target: issue2) }
    let(:search_user) { user }
    let(:params) { {} }
    let(:issues) { described_class.new(search_user, params.reverse_merge(scope: scope, state: 'opened')).execute }

    before(:context) do
      project1.add_master(user)
      project2.add_developer(user)
      project2.add_developer(user2)
      project3.add_developer(user)

      issue1
      issue2
      issue3
      issue4

      award_emoji1
      award_emoji2
      award_emoji3
    end

    context 'scope: all' do
      let(:scope) { 'all' }

      it 'returns all issues' 


      context 'filtering by assignee ID' do
        let(:params) { { assignee_id: user.id } }

        it 'returns issues assigned to that user' 

      end

      context 'filtering by group_id' do
        let(:params) { { group_id: group.id } }

        context 'when include_subgroup param not set' do
          it 'returns all group issues' 

        end

        context 'when include_subgroup param is true', :nested_groups do
          before do
            params[:include_subgroups] = true
          end

          it 'returns all group and subgroup issues' 

        end
      end

      context 'filtering by author ID' do
        let(:params) { { author_id: user2.id } }

        it 'returns issues created by that user' 

      end

      context 'filtering by milestone' do
        let(:params) { { milestone_title: milestone.title } }

        it 'returns issues assigned to that milestone' 

      end

      context 'filtering by group milestone' do
        let!(:group) { create(:group, :public) }
        let(:group_milestone) { create(:milestone, group: group) }
        let!(:group_member) { create(:group_member, group: group, user: user) }
        let(:params) { { milestone_title: group_milestone.title } }

        before do
          project2.update(namespace: group)
          issue2.update(milestone: group_milestone)
          issue3.update(milestone: group_milestone)
        end

        it 'returns issues assigned to that group milestone' 

      end

      context 'filtering by no milestone' do
        let(:params) { { milestone_title: Milestone::None.title } }

        it 'returns issues with no milestone' 

      end

      context 'filtering by upcoming milestone' do
        let(:params) { { milestone_title: Milestone::Upcoming.name } }

        let(:project_no_upcoming_milestones) { create(:project, :public) }
        let(:project_next_1_1) { create(:project, :public) }
        let(:project_next_8_8) { create(:project, :public) }

        let(:yesterday) { Date.today - 1.day }
        let(:tomorrow) { Date.today + 1.day }
        let(:two_days_from_now) { Date.today + 2.days }
        let(:ten_days_from_now) { Date.today + 10.days }

        let(:milestones) do
          [
            create(:milestone, :closed, project: project_no_upcoming_milestones),
            create(:milestone, project: project_next_1_1, title: '1.1', due_date: two_days_from_now),
            create(:milestone, project: project_next_1_1, title: '8.8', due_date: ten_days_from_now),
            create(:milestone, project: project_next_8_8, title: '1.1', due_date: yesterday),
            create(:milestone, project: project_next_8_8, title: '8.8', due_date: tomorrow)
          ]
        end

        before do
          milestones.each do |milestone|
            create(:issue, project: milestone.project, milestone: milestone, author: user, assignees: [user])
          end
        end

        it 'returns issues in the upcoming milestone for each project' 

      end

      context 'filtering by started milestone' do
        let(:params) { { milestone_title: Milestone::Started.name } }

        let(:project_no_started_milestones) { create(:project, :public) }
        let(:project_started_1_and_2) { create(:project, :public) }
        let(:project_started_8) { create(:project, :public) }

        let(:yesterday) { Date.today - 1.day }
        let(:tomorrow) { Date.today + 1.day }
        let(:two_days_ago) { Date.today - 2.days }

        let(:milestones) do
          [
            create(:milestone, project: project_no_started_milestones, start_date: tomorrow),
            create(:milestone, project: project_started_1_and_2, title: '1.0', start_date: two_days_ago),
            create(:milestone, project: project_started_1_and_2, title: '2.0', start_date: yesterday),
            create(:milestone, project: project_started_1_and_2, title: '3.0', start_date: tomorrow),
            create(:milestone, project: project_started_8, title: '7.0'),
            create(:milestone, project: project_started_8, title: '8.0', start_date: yesterday),
            create(:milestone, project: project_started_8, title: '9.0', start_date: tomorrow)
          ]
        end

        before do
          milestones.each do |milestone|
            create(:issue, project: milestone.project, milestone: milestone, author: user, assignees: [user])
          end
        end

        it 'returns issues in the started milestones for each project' 

      end

      context 'filtering by label' do
        let(:params) { { label_name: label.title } }

        it 'returns issues with that label' 

      end

      context 'filtering by multiple labels' do
        let(:params) { { label_name: [label.title, label2.title].join(',') } }
        let(:label2) { create(:label, project: project2) }

        before do
          create(:label_link, label: label2, target: issue2)
        end

        it 'returns the unique issues with any of those labels' 

      end

      context 'filtering by no label' do
        let(:params) { { label_name: Label::None.title } }

        it 'returns issues with no labels' 

      end

      context 'filtering by issue term' do
        let(:params) { { search: 'git' } }

        it 'returns issues with title and description match for search term' 

      end

      context 'filtering by issues iids' do
        let(:params) { { iids: issue3.iid } }

        it 'returns issues with iids match' 

      end

      context 'filtering by state' do
        context 'with opened' do
          let(:params) { { state: 'opened' } }

          it 'returns only opened issues' 

        end

        context 'with closed' do
          let(:params) { { state: 'closed' } }

          it 'returns only closed issues' 

        end

        context 'with all' do
          let(:params) { { state: 'all' } }

          it 'returns all issues' 

        end

        context 'with invalid state' do
          let(:params) { { state: 'invalid_state' } }

          it 'returns all issues' 

        end
      end

      context 'filtering by created_at' do
        context 'through created_after' do
          let(:params) { { created_after: issue3.created_at } }

          it 'returns issues created on or after the given date' 

        end

        context 'through created_before' do
          let(:params) { { created_before: issue1.created_at } }

          it 'returns issues created on or before the given date' 

        end

        context 'through created_after and created_before' do
          let(:params) { { created_after: issue2.created_at, created_before: issue3.created_at } }

          it 'returns issues created between the given dates' 

        end
      end

      context 'filtering by updated_at' do
        context 'through updated_after' do
          let(:params) { { updated_after: issue3.updated_at } }

          it 'returns issues updated on or after the given date' 

        end

        context 'through updated_before' do
          let(:params) { { updated_before: issue1.updated_at } }

          it 'returns issues updated on or before the given date' 

        end

        context 'through updated_after and updated_before' do
          let(:params) { { updated_after: issue2.updated_at, updated_before: issue3.updated_at } }

          it 'returns issues updated between the given dates' 

        end
      end

      context 'filtering by reaction name' do
        context 'user searches by "thumbsup" reaction' do
          let(:params) { { my_reaction_emoji: 'thumbsup' } }

          it 'returns issues that the user thumbsup to' 

        end

        context 'user2 searches by "thumbsup" reaction' do
          let(:search_user) { user2 }

          let(:params) { { my_reaction_emoji: 'thumbsup' } }

          it 'returns issues that the user2 thumbsup to' 

        end

        context 'user searches by "thumbsdown" reaction' do
          let(:params) { { my_reaction_emoji: 'thumbsdown' } }

          it 'returns issues that the user thumbsdown to' 

        end
      end

      context 'when the user is unauthorized' do
        let(:search_user) { nil }

        it 'returns no results' 

      end

      context 'when the user can see some, but not all, issues' do
        let(:search_user) { user2 }

        it 'returns only issues they can see' 

      end

      it 'finds issues user can access due to group' 

    end

    context 'personal scope' do
      let(:scope) { 'assigned-to-me' }

      it 'returns issue assigned to the user' 


      context 'filtering by project' do
        let(:params) { { project_id: project1.id } }

        it 'returns issues assigned to the user in that project' 

      end
    end

    context 'when project restricts issues' do
      let(:scope) { nil }

      it "doesn't return team-only issues to non team members" 


      it "doesn't return issues if feature disabled" 

    end
  end

  describe '#row_count', :request_store do
    it 'returns the number of rows for the default state' 


    it 'returns the number of rows for a given state' 

  end

  describe '#with_confidentiality_access_check' do
    let(:guest) { create(:user) }
    set(:authorized_user) { create(:user) }
    set(:project) { create(:project, namespace: authorized_user.namespace) }
    set(:public_issue) { create(:issue, project: project) }
    set(:confidential_issue) { create(:issue, project: project, confidential: true) }

    context 'when no project filter is given' do
      let(:params) { {} }

      context 'for an anonymous user' do
        subject { described_class.new(nil, params).with_confidentiality_access_check }

        it 'returns only public issues' 

      end

      context 'for a user without project membership' do
        subject { described_class.new(user, params).with_confidentiality_access_check }

        it 'returns only public issues' 

      end

      context 'for a guest user' do
        subject { described_class.new(guest, params).with_confidentiality_access_check }

        before do
          project.add_guest(guest)
        end

        it 'returns only public issues' 

      end

      context 'for a project member with access to view confidential issues' do
        subject { described_class.new(authorized_user, params).with_confidentiality_access_check }

        it 'returns all issues' 

      end
    end

    context 'when searching within a specific project' do
      let(:params) { { project_id: project.id } }

      context 'for an anonymous user' do
        subject { described_class.new(nil, params).with_confidentiality_access_check }

        it 'returns only public issues' 


        it 'does not filter by confidentiality' 

      end

      context 'for a user without project membership' do
        subject { described_class.new(user, params).with_confidentiality_access_check }

        it 'returns only public issues' 


        it 'filters by confidentiality' 

      end

      context 'for a guest user' do
        subject { described_class.new(guest, params).with_confidentiality_access_check }

        before do
          project.add_guest(guest)
        end

        it 'returns only public issues' 


        it 'filters by confidentiality' 

      end

      context 'for a project member with access to view confidential issues' do
        subject { described_class.new(authorized_user, params).with_confidentiality_access_check }

        it 'returns all issues' 


        it 'does not filter by confidentiality' 

      end
    end
  end
end

