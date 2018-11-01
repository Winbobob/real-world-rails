require 'spec_helper'

describe Issues::MoveService do
  let(:user) { create(:user) }
  let(:author) { create(:user) }
  let(:title) { 'Some issue' }
  let(:description) { 'Some issue description' }
  let(:group) { create(:group, :private) }
  let(:sub_group_1) { create(:group, :private, parent: group) }
  let(:sub_group_2) { create(:group, :private, parent: group) }
  let(:old_project) { create(:project, namespace: sub_group_1) }
  let(:new_project) { create(:project, namespace: sub_group_2) }
  let(:milestone1) { create(:milestone, project_id: old_project.id, title: 'v9.0') }

  let(:old_issue) do
    create(:issue, title: title, description: description,
                   project: old_project, author: author, milestone: milestone1)
  end

  subject(:move_service) do
    described_class.new(old_project, user)
  end

  shared_context 'user can move issue' do
    before do
      old_project.add_reporter(user)
      new_project.add_reporter(user)

      labels = Array.new(2) { |x| "label%d" % (x + 1) }

      labels.each do |label|
        old_issue.labels << create(:label,
          project_id: old_project.id,
          title: label)

        new_project.labels << create(:label, title: label)
      end
    end
  end

  describe '#execute' do
    shared_context 'issue move executed' do
      let!(:award_emoji) { create(:award_emoji, awardable: old_issue) }

      let!(:new_issue) { move_service.execute(old_issue, new_project) }
    end

    context 'issue movable' do
      include_context 'user can move issue'

      context 'move to new milestone'  do
        let(:new_issue) { move_service.execute(old_issue, new_project) }

        context 'project milestone' do
          let!(:milestone2) do
            create(:milestone, project_id: new_project.id, title: 'v9.0')
          end

          it 'assigns milestone to new issue' 

        end

        context 'group milestones' do
          let!(:group) { create(:group, :private) }
          let!(:group_milestone_1) do
            create(:milestone, group_id: group.id, title: 'v9.0_group')
          end

          before do
            old_issue.update(milestone: group_milestone_1)
            old_project.update(namespace: group)
            new_project.update(namespace: group)

            group.add_users([user], GroupMember::DEVELOPER)
          end

          context 'when moving to a project of the same group' do
            it 'keeps the same group milestone' 

          end

          context 'when moving to a project of a different group' do
            let!(:group_2) { create(:group, :private) }

            let!(:group_milestone_2) do
              create(:milestone, group_id: group_2.id, title: 'v9.0_group')
            end

            before do
              old_issue.update(milestone: group_milestone_1)
              new_project.update(namespace: group_2)

              group_2.add_users([user], GroupMember::DEVELOPER)
            end

            it 'assigns to new group milestone of same title' 

          end
        end
      end

      context 'issue with group labels', :nested_groups do
        it 'assigns group labels to new issue' 

      end

      context 'issue with resource label events' do
        it 'assigns resource label events to new issue' 

      end

      context 'generic issue' do
        include_context 'issue move executed'

        it 'creates a new issue in a new project' 


        it 'assign labels to new issue' 


        it 'rewrites issue title' 


        it 'rewrites issue description' 


        it 'adds system note to old issue at the end' 


        it 'adds system note to new issue at the end' 


        it 'closes old issue' 


        it 'persists new issue' 


        it 'persists all changes' 


        it 'preserves author' 


        it 'creates a new internal id for issue' 


        it 'marks issue as moved' 


        it 'preserves create time' 


        it 'moves the award emoji' 

      end

      context 'issue with notes' do
        context 'notes without references' do
          let(:notes_params) do
            [{ system: false, note: 'Some comment 1' },
             { system: true, note: 'Some system note' },
             { system: false, note: 'Some comment 2' }]
          end
          let(:award_names) { %w(thumbsup thumbsdown facepalm) }
          let(:notes_contents) { notes_params.map { |n| n[:note] } }

          before do
            note_params = { noteable: old_issue, project: old_project, author: author }
            notes_params.each_with_index do |note, index|
              new_note = create(:note, note_params.merge(note))
              award_emoji_params = { awardable: new_note, name: award_names[index] }
              create(:award_emoji, award_emoji_params)
            end
          end

          include_context 'issue move executed'

          let(:all_notes) { new_issue.notes.order('id ASC') }
          let(:system_notes) { all_notes.system }
          let(:user_notes) { all_notes.user }

          it 'rewrites existing notes in valid order' 


          it 'creates new emojis for the new notes' 


          it 'adds a system note about move after rewritten notes' 


          it 'preserves orignal author of comment' 

        end

        context 'note that has been updated' do
          let!(:note) do
            create(:note, noteable: old_issue, project: old_project,
                          author: author, updated_at: Date.yesterday,
                          created_at: Date.yesterday)
          end

          include_context 'issue move executed'

          it 'preserves time when note has been created at' 


          it 'preserves time when note has been updated at' 

        end

        context 'issue with assignee' do
          let(:assignee) { create(:user) }

          before do
            old_issue.assignees = [assignee]
          end

          it 'preserves assignee with access to the new issue' 


          it 'ignores assignee without access to the new issue' 

        end

        context 'notes with references' do
          before do
            create(:merge_request, source_project: old_project)
            create(:note, noteable: old_issue, project: old_project, author: author,
                          note: 'Note with reference to merge request !1')
          end

          include_context 'issue move executed'
          let(:new_note) { new_issue.notes.first }

          it 'rewrites references using a cross reference to old project' 

        end

        context 'issue description with uploads' do
          let(:uploader) { build(:file_uploader, project: old_project) }
          let(:description) { "Text and #{uploader.markdown_link}" }

          include_context 'issue move executed'

          it 'rewrites uploads in description' 

        end
      end

      describe 'rewriting references' do
        include_context 'issue move executed'

        context 'issue references' do
          let(:another_issue) { create(:issue, project: old_project) }
          let(:description) { "Some description #{another_issue.to_reference}" }

          it 'rewrites referenced issues creating cross project reference' 

        end

        context "user references" do
          let(:another_issue) { create(:issue, project: old_project) }
          let(:description) { "Some description #{user.to_reference}" }

          it "doesn't throw any errors for issues containing user references" 

        end
      end

      context 'moving to same project' do
        let(:new_project) { old_project }

        it 'raises error' 

      end

      context 'project issue hooks' do
        let!(:hook) { create(:project_hook, project: old_project, issues_events: true) }

        it 'executes project issue hooks' 

      end
    end

    describe 'move permissions' do
      let(:move) { move_service.execute(old_issue, new_project) }

      context 'user is reporter in both projects' do
        include_context 'user can move issue'
        it { expect { move }.not_to raise_error }
      end

      context 'user is reporter only in new project' do
        before do
          new_project.add_reporter(user)
        end

        it { expect { move }.to raise_error(StandardError, /permissions/) }
      end

      context 'user is reporter only in old project' do
        before do
          old_project.add_reporter(user)
        end

        it { expect { move }.to raise_error(StandardError, /permissions/) }
      end

      context 'user is reporter in one project and guest in another' do
        before do
          new_project.add_guest(user)
          old_project.add_reporter(user)
        end

        it { expect { move }.to raise_error(StandardError, /permissions/) }
      end

      context 'issue has already been moved' do
        include_context 'user can move issue'

        let(:moved_to_issue) { create(:issue) }

        let(:old_issue) do
          create(:issue, project: old_project, author: author,
                         moved_to: moved_to_issue)
        end

        it { expect { move }.to raise_error(StandardError, /permissions/) }
      end

      context 'issue is not persisted' do
        include_context 'user can move issue'
        let(:old_issue) { build(:issue, project: old_project, author: author) }
        it { expect { move }.to raise_error(StandardError, /permissions/) }
      end
    end

    context 'movable issue with no assigned labels' do
      before do
        old_project.add_reporter(user)
        new_project.add_reporter(user)

        labels = Array.new(2) { |x| "label%d" % (x + 1) }

        labels.each do |label|
          new_project.labels << create(:label, title: label)
        end
      end

      include_context 'issue move executed'

      it 'does not assign labels to new issue' 

    end
  end
end

