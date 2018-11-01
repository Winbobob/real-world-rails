require 'spec_helper'

describe Labels::PromoteService do
  describe '#execute' do
    let!(:user) { create(:user) }

    context 'project without group' do
      let!(:project_1)  { create(:project) }

      let!(:project_label_1_1)  { create(:label, project: project_1) }

      subject(:service) { described_class.new(project_1, user) }

      it 'fails on project without group' 

    end

    context 'project with group' do
      let!(:promoted_label_name)  { "Promoted Label" }
      let!(:untouched_label_name) { "Untouched Label" }
      let!(:promoted_description) { "Promoted Description" }
      let!(:promoted_color)       { "#0000FF" }
      let!(:label_2_1_priority)   { 1 }
      let!(:label_3_1_priority)   { 2 }

      let!(:group_1)  { create(:group) }
      let!(:group_2)  { create(:group) }

      let!(:project_1)  { create(:project, namespace: group_1) }
      let!(:project_2)  { create(:project, namespace: group_1) }
      let!(:project_3)  { create(:project, namespace: group_1) }
      let!(:project_4)  { create(:project, namespace: group_2) }

      # Labels/issues can't be lazily created so we might as well eager initialize
      # all other objects too since we use them inside
      let!(:project_label_1_1)  { create(:label, project: project_1, name: promoted_label_name, color: promoted_color, description: promoted_description) }
      let!(:project_label_1_2)  { create(:label, project: project_1, name: untouched_label_name) }
      let!(:project_label_2_1)  { create(:label, project: project_2, priority: label_2_1_priority, name: promoted_label_name, color: "#FF0000") }
      let!(:project_label_3_1)  { create(:label, project: project_3, priority: label_3_1_priority, name: promoted_label_name) }
      let!(:project_label_3_2)  { create(:label, project: project_3, priority: 1, name: untouched_label_name) }
      let!(:project_label_4_1)  { create(:label, project: project_4, name: promoted_label_name) }

      let!(:issue_1_1)  { create(:labeled_issue, project: project_1, labels: [project_label_1_1, project_label_1_2]) }
      let!(:issue_1_2)  { create(:labeled_issue, project: project_1, labels: [project_label_1_2]) }
      let!(:issue_2_1)  { create(:labeled_issue, project: project_2, labels: [project_label_2_1]) }
      let!(:issue_4_1)  { create(:labeled_issue, project: project_4, labels: [project_label_4_1]) }

      let!(:merge_3_1)  { create(:labeled_merge_request, source_project: project_3, target_project: project_3, labels: [project_label_3_1, project_label_3_2]) }

      let!(:issue_board_2_1)      { create(:board, project: project_2) }
      let!(:issue_board_list_2_1) { create(:list, board: issue_board_2_1, label: project_label_2_1) }

      let(:new_label) { group_1.labels.find_by(title: promoted_label_name) }

      subject(:service) { described_class.new(project_1, user) }

      it 'fails on group label' 


      it 'is truthy on success' 


      it 'recreates the label as a group label' 


      it 'copies title, description and color' 


      it 'merges labels with the same name in group' 


      it 'keeps users\' subscriptions' 


      it 'recreates priorities' 


      it 'does not touch project out of promoted group' 


      it 'does not touch out of group priority' 


      it 'relinks issue with the promoted label' 


      it 'does not remove untouched labels from issue' 


      it 'does not relink untouched label in issue' 


      it 'relinks issues with merged labels' 


      it 'does not relink issues from other group' 


      it 'updates merge request' 


      it 'updates board lists' 


      # In case someone adds a new relation to Label.rb and forgets to relink it
      # and the database doesn't have foreign key constraints
      it 'relinks all relations' 


      context 'with invalid group label' do
        before do
          allow(service).to receive(:clone_label_to_group_label).and_wrap_original do |m, *args|
            label = m.call(*args)
            allow(label).to receive(:valid?).and_return(false)

            label
          end
        end

        it 'raises an exception' 

      end
    end
  end
end

