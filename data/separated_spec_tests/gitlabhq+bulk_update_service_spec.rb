require 'spec_helper'

describe Issuable::BulkUpdateService do
  let(:user)    { create(:user) }
  let(:project) { create(:project, namespace: user.namespace) }

  def bulk_update(issuables, extra_params = {})
    bulk_update_params = extra_params
      .reverse_merge(issuable_ids: Array(issuables).map(&:id).join(','))

    type = Array(issuables).first.model_name.param_key
    Issuable::BulkUpdateService.new(project, user, bulk_update_params).execute(type)
  end

  describe 'close issues' do
    let(:issues) { create_list(:issue, 2, project: project) }

    it 'succeeds and returns the correct number of issues updated' 


    it 'closes all the issues passed' 

  end

  describe 'reopen issues' do
    let(:issues) { create_list(:closed_issue, 2, project: project) }

    it 'succeeds and returns the correct number of issues updated' 


    it 'reopens all the issues passed' 

  end

  describe 'updating merge request assignee' do
    let(:merge_request) { create(:merge_request, target_project: project, source_project: project, assignee: user) }

    context 'when the new assignee ID is a valid user' do
      it 'succeeds' 


      it 'updates the assignee to the user ID passed' 

    end

    context "when the new assignee ID is #{IssuableFinder::NONE}" do
      it 'unassigns the issues' 

    end

    context 'when the new assignee ID is not present' do
      it 'does not unassign' 

    end
  end

  describe 'updating issue assignee' do
    let(:issue) { create(:issue, project: project, assignees: [user]) }

    context 'when the new assignee ID is a valid user' do
      it 'succeeds' 


      it 'updates the assignee to the user ID passed' 

    end

    context "when the new assignee ID is #{IssuableFinder::NONE}" do
      it "unassigns the issues" 

    end

    context 'when the new assignee ID is not present' do
      it 'does not unassign' 

    end
  end

  describe 'updating milestones' do
    let(:issue)     { create(:issue, project: project) }
    let(:milestone) { create(:milestone, project: project) }

    it 'succeeds' 


    it 'updates the issue milestone' 

  end

  describe 'updating labels' do
    def create_issue_with_labels(labels)
      create(:labeled_issue, project: project, labels: labels)
    end

    let(:bug) { create(:label, project: project) }
    let(:regression) { create(:label, project: project) }
    let(:merge_requests) { create(:label, project: project) }

    let(:issue_all_labels) { create_issue_with_labels([bug, regression, merge_requests]) }
    let(:issue_bug_and_regression) { create_issue_with_labels([bug, regression]) }
    let(:issue_bug_and_merge_requests) { create_issue_with_labels([bug, merge_requests]) }
    let(:issue_no_labels) { create(:issue, project: project) }
    let(:issues) { [issue_all_labels, issue_bug_and_regression, issue_bug_and_merge_requests, issue_no_labels] }

    let(:labels) { [] }
    let(:add_labels) { [] }
    let(:remove_labels) { [] }

    let(:bulk_update_params) do
      {
        label_ids:        labels.map(&:id),
        add_label_ids:    add_labels.map(&:id),
        remove_label_ids: remove_labels.map(&:id)
      }
    end

    before do
      bulk_update(issues, bulk_update_params)
    end

    context 'when label_ids are passed' do
      let(:issues) { [issue_all_labels, issue_no_labels] }
      let(:labels) { [bug, regression] }

      it 'updates the labels of all issues passed to the labels passed' 


      it 'does not update issues not passed in' 


      context 'when those label IDs are empty' do
        let(:labels) { [] }

        it 'updates the issues passed to have no labels' 

      end
    end

    context 'when add_label_ids are passed' do
      let(:issues) { [issue_all_labels, issue_bug_and_merge_requests, issue_no_labels] }
      let(:add_labels) { [bug, regression, merge_requests] }

      it 'adds those label IDs to all issues passed' 


      it 'does not update issues not passed in' 

    end

    context 'when remove_label_ids are passed' do
      let(:issues) { [issue_all_labels, issue_bug_and_merge_requests, issue_no_labels] }
      let(:remove_labels) { [bug, regression, merge_requests] }

      it 'removes those label IDs from all issues passed' 


      it 'does not update issues not passed in' 

    end

    context 'when add_label_ids and remove_label_ids are passed' do
      let(:issues) { [issue_all_labels, issue_bug_and_merge_requests, issue_no_labels] }
      let(:add_labels) { [bug] }
      let(:remove_labels) { [merge_requests] }

      it 'adds the label IDs to all issues passed' 


      it 'removes the label IDs from all issues passed' 


      it 'does not update issues not passed in' 

    end

    context 'when add_label_ids and label_ids are passed' do
      let(:issues) { [issue_all_labels, issue_bug_and_regression, issue_bug_and_merge_requests] }
      let(:labels) { [merge_requests] }
      let(:add_labels) { [regression] }

      it 'adds the label IDs to all issues passed' 


      it 'ignores the label IDs parameter' 


      it 'does not update issues not passed in' 

    end

    context 'when remove_label_ids and label_ids are passed' do
      let(:issues) { [issue_no_labels, issue_bug_and_regression] }
      let(:labels) { [merge_requests] }
      let(:remove_labels) { [regression] }

      it 'removes the label IDs from all issues passed' 


      it 'ignores the label IDs parameter' 


      it 'does not update issues not passed in' 

    end

    context 'when add_label_ids, remove_label_ids, and label_ids are passed' do
      let(:issues) { [issue_bug_and_merge_requests, issue_no_labels] }
      let(:labels) { [regression] }
      let(:add_labels) { [bug] }
      let(:remove_labels) { [merge_requests] }

      it 'adds the label IDs to all issues passed' 


      it 'removes the label IDs from all issues passed' 


      it 'ignores the label IDs parameter' 


      it 'does not update issues not passed in' 

    end
  end

  describe 'subscribe to issues' do
    let(:issues) { create_list(:issue, 2, project: project) }

    it 'subscribes the given user' 

  end

  describe 'unsubscribe from issues' do
    let(:issues) do
      create_list(:closed_issue, 2, project: project) do |issue|
        issue.subscriptions.create(user: user, project: project, subscribed: true)
      end
    end

    it 'unsubscribes the given user' 

  end
end

