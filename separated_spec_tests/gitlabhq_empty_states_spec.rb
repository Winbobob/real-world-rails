require 'spec_helper'

feature 'Group empty states' do
  let(:group) { create(:group) }
  let(:user) { create(:group_member, :developer, user: create(:user), group: group ).user }

  before do
    sign_in(user)
  end

  [:issue, :merge_request].each do |issuable|
    issuable_name = issuable.to_s.humanize.downcase
    project_relation = issuable == :issue ? :project : :source_project

    context "for #{issuable_name}s" do
      let(:path) { public_send(:"#{issuable}s_group_path", group) }

      context 'group has a project' do
        let(:project) { create(:project, namespace: group) }

        before do
          project.add_master(user)
        end

        context "the project has #{issuable_name}s" do
          before do
            create(issuable, project_relation => project)

            visit path
          end

          it 'does not display an empty state' 

        end

        context "the project has no #{issuable_name}s", :js do
          before do
            visit path
          end

          it 'displays an empty state' 


          it "shows a new #{issuable_name} button" 


          it "the new #{issuable_name} button opens a project dropdown" 

        end
      end

      context 'group without a project' do
        context 'group has a subgroup', :nested_groups do
          let(:subgroup) { create(:group, parent: group) }
          let(:subgroup_project) { create(:project, namespace: subgroup) }

          context "the project has #{issuable_name}s" do
            before do
              create(issuable, project_relation => subgroup_project)

              visit path
            end

            it 'does not display an empty state' 

          end

          context "the project has no #{issuable_name}s" do
            before do
              visit path
            end

            it 'displays an empty state' 

          end
        end

        context 'group has no subgroups' do
          before do
            visit path
          end

          it 'displays an empty state' 


          it "shows a new #{issuable_name} button" 

        end
      end
    end
  end
end

