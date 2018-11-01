require 'spec_helper'

describe Gitlab::ImportExport::ProjectTreeSaver do
  describe 'saves the project tree into a json object' do
    let(:shared) { project.import_export_shared }
    let(:project_tree_saver) { described_class.new(project: project, current_user: user, shared: shared) }
    let(:export_path) { "#{Dir.tmpdir}/project_tree_saver_spec" }
    let(:user) { create(:user) }
    let!(:project) { setup_project }

    before do
      project.add_maintainer(user)
      allow_any_instance_of(Gitlab::ImportExport).to receive(:storage_path).and_return(export_path)
      allow_any_instance_of(MergeRequest).to receive(:source_branch_sha).and_return('ABCD')
      allow_any_instance_of(MergeRequest).to receive(:target_branch_sha).and_return('DCBA')
    end

    after do
      FileUtils.rm_rf(export_path)
    end

    it 'saves project successfully' 


    context 'JSON' do
      let(:saved_project_json) do
        project_tree_saver.save
        project_json(project_tree_saver.full_path)
      end

      context 'with description override' do
        let(:params) { { description: 'Foo Bar' } }
        let(:project_tree_saver) { described_class.new(project: project, current_user: user, shared: shared, params: params) }

        it 'overrides the project description' 

      end

      it 'saves the correct json' 


      it 'has milestones' 


      it 'has merge requests' 


      it 'has merge request\'s milestones' 


      it 'has merge request\'s source branch SHA' 


      it 'has merge request\'s target branch SHA' 


      it 'has events' 


      it 'has snippets' 


      it 'has snippet notes' 


      it 'has releases' 


      it 'has issues' 


      it 'has issue comments' 


      it 'has issue assignees' 


      it 'has author on issue comments' 


      it 'has project members' 


      it 'has merge requests diffs' 


      it 'has merge request diff files' 


      it 'has merge request diff commits' 


      it 'has merge requests comments' 


      it 'has author on merge requests comments' 


      it 'has pipeline stages' 


      it 'has pipeline statuses' 


      it 'has pipeline builds' 


      it 'has no when YML attributes but only the DB column' 


      it 'has pipeline commits' 


      it 'has ci pipeline notes' 


      it 'has labels with no associations' 


      it 'has labels associated to records' 


      it 'has project and group labels' 


      it 'has priorities associated to labels' 


      it 'has issue resource label events' 


      it 'has merge request resource label events' 


      it 'saves the correct service type' 


      it 'saves the properties for a service' 


      it 'has project feature' 


      it 'has custom attributes' 


      it 'has badges' 


      it 'does not complain about non UTF-8 characters in MR diff files' 


      context 'group members' do
        let(:user2) { create(:user, email: 'group@member.com') }
        let(:member_emails) do
          saved_project_json['project_members'].map do |pm|
            pm['user']['email']
          end
        end

        before do
          Group.first.add_developer(user2)
        end

        it 'does not export group members if it has no permission' 


        it 'does not export group members as maintainer' 


        it 'exports group members as group owner' 


        context 'as admin' do
          let(:user) { create(:admin) }

          it 'exports group members as admin' 


          it 'exports group members as project members' 

        end
      end

      context 'project attributes' do
        it 'does not contain the runners token' 

      end
    end
  end

  def setup_project
    issue = create(:issue, assignees: [user])
    snippet = create(:project_snippet)
    release = create(:release)
    group = create(:group)

    project = create(:project,
                     :public,
                     :repository,
                     :issues_disabled,
                     :wiki_enabled,
                     :builds_private,
                     description: 'description',
                     issues: [issue],
                     snippets: [snippet],
                     releases: [release],
                     group: group
                    )
    project_label = create(:label, project: project)
    group_label = create(:group_label, group: group)
    create(:label_link, label: project_label, target: issue)
    create(:label_link, label: group_label, target: issue)
    create(:label_priority, label: group_label, priority: 1)
    milestone = create(:milestone, project: project)
    merge_request = create(:merge_request, source_project: project, milestone: milestone)

    ci_build = create(:ci_build, project: project, when: nil)
    ci_build.pipeline.update(project: project)
    create(:commit_status, project: project, pipeline: ci_build.pipeline)

    create(:milestone, project: project)
    create(:note, noteable: issue, project: project)
    create(:note, noteable: merge_request, project: project)
    create(:note, noteable: snippet, project: project)
    create(:note_on_commit,
           author: user,
           project: project,
           commit_id: ci_build.pipeline.sha)

    create(:resource_label_event, label: project_label, issue: issue)
    create(:resource_label_event, label: group_label, merge_request: merge_request)

    create(:event, :created, target: milestone, project: project, author: user)
    create(:service, project: project, type: 'CustomIssueTrackerService', category: 'issue_tracker', properties: { one: 'value' })

    create(:project_custom_attribute, project: project)
    create(:project_custom_attribute, project: project)

    create(:project_badge, project: project)
    create(:project_badge, project: project)

    project
  end

  def project_json(filename)
    JSON.parse(IO.read(filename))
  end
end

