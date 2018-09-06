require 'spec_helper'

describe LabelsHelper do
  describe '#show_label_issuables_link?' do
    shared_examples 'a valid response to show_label_issuables_link?' do |issuables_type, when_enabled = true, when_disabled = false|
      let(:context_project) { project }

      context "when asking for a #{issuables_type} link" do
        subject { show_label_issuables_link?(label, issuables_type, project: context_project) }

        context "when #{issuables_type} are enabled for the project" do
          let(:project) { create(:project, "#{issuables_type}_access_level": ProjectFeature::ENABLED) }

          it { is_expected.to be(when_enabled) }
        end

        context "when #{issuables_type} are disabled for the project" do
          let(:project) { create(:project, :public, "#{issuables_type}_access_level": ProjectFeature::DISABLED) }

          it { is_expected.to be(when_disabled) }
        end
      end
    end

    context 'with a project label' do
      let(:label) { create(:label, project: project, title: 'bug') }

      context 'when asking for an issue link' do
        it_behaves_like 'a valid response to show_label_issuables_link?', :issues
      end

      context 'when asking for a merge requests link' do
        it_behaves_like 'a valid response to show_label_issuables_link?', :merge_requests
      end
    end

    context 'with a group label' do
      set(:group) { create(:group) }
      let(:label) { create(:group_label, group: group, title: 'bug') }

      context 'when asking for an issue link' do
        context 'in the context of a project' do
          it_behaves_like 'a valid response to show_label_issuables_link?', :issues, true, true
        end

        context 'in the context of a group' do
          let(:context_project) { nil }

          it_behaves_like 'a valid response to show_label_issuables_link?', :issues, true, true
        end
      end

      context 'when asking for a merge requests link' do
        context 'in the context of a project' do
          it_behaves_like 'a valid response to show_label_issuables_link?', :merge_requests, true, true
        end

        context 'in the context of a group' do
          let(:context_project) { nil }

          it_behaves_like 'a valid response to show_label_issuables_link?', :merge_requests, true, true
        end
      end
    end
  end

  describe 'link_to_label' do
    let(:project) { create(:project) }
    let(:label) { create(:label, project: project) }

    context 'without subject' do
      it "uses the label's project" 

    end

    context 'with a project as subject' do
      let(:namespace) { build(:namespace, name: 'foo3') }
      let(:another_project) { build(:project, namespace: namespace, name: 'bar3') }

      it 'links to project issues page' 

    end

    context 'with a group as subject' do
      let(:group) { build(:group, name: 'bar') }

      it 'links to group issues page' 

    end

    context 'with a type argument' do
      ['issue', :issue, 'merge_request', :merge_request].each do |type|
        context "set to #{type}" do
          it 'links to correct page' 

        end
      end
    end

    context 'with a tooltip argument' do
      context 'set to false' do
        it 'does not include the has-tooltip class' 

      end
    end

    context 'with block' do
      it 'passes the block to link_to' 

    end

    context 'without block' do
      it 'uses render_colored_label as the link content' 

    end
  end

  describe 'text_color_for_bg' do
    it 'uses light text on dark backgrounds' 


    it 'uses dark text on light backgrounds' 


    it 'supports RGB triplets' 

  end

  describe 'create_label_title' do
    set(:group) { create(:group) }

    context 'with a group as subject' do
      it 'returns "Create group label"' 

    end

    context 'with a project as subject' do
      set(:project) { create(:project, namespace: group) }

      it 'returns "Create project label"' 

    end

    context 'with no subject' do
      it 'returns "Create new label"' 

    end
  end

  describe 'manage_labels_title' do
    set(:group) { create(:group) }

    context 'with a group as subject' do
      it 'returns "Manage group labels"' 

    end

    context 'with a project as subject' do
      set(:project) { create(:project, namespace: group) }

      it 'returns "Manage project labels"' 

    end

    context 'with no subject' do
      it 'returns "Manage labels"' 

    end
  end

  describe 'view_labels_title' do
    set(:group) { create(:group) }

    context 'with a group as subject' do
      it 'returns "View group labels"' 

    end

    context 'with a project as subject' do
      set(:project) { create(:project, namespace: group) }

      it 'returns "View project labels"' 

    end

    context 'with no subject' do
      it 'returns "View labels"' 

    end
  end
end

