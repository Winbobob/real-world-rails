require 'spec_helper'

describe NotesFinder do
  let(:user) { create :user }
  let(:project) { create(:project) }

  before do
    project.add_master(user)
  end

  describe '#execute' do
    it 'finds notes on merge requests' 


    it 'finds notes on snippets' 


    it "excludes notes on commits the author can't download" 


    it 'succeeds when no notes found' 


    context 'on restricted projects' do
      let(:project) do
        create(:project,
               :public,
               :issues_private,
               :snippets_private,
               :merge_requests_private)
      end

      it 'publicly excludes notes on merge requests' 


      it 'publicly excludes notes on issues' 


      it 'publicly excludes notes on snippets' 

    end

    context 'for target type' do
      let(:project) { create(:project, :repository) }
      let!(:note1) { create :note_on_issue, project: project }
      let!(:note2) { create :note_on_commit, project: project }

      it 'finds only notes for the selected type' 

    end

    context 'for target' do
      let(:project) { create(:project, :repository) }
      let(:note1) { create :note_on_commit, project: project }
      let(:note2) { create :note_on_commit, project: project }
      let(:commit) { note1.noteable }
      let(:params)  { { target_id: commit.id, target_type: 'commit', last_fetched_at: 1.hour.ago.to_i } }

      before do
        note1
        note2
      end

      it 'finds all notes' 


      it 'finds notes on merge requests' 


      it 'finds notes on snippets' 


      it 'finds notes on personal snippets' 


      it 'raises an exception for an invalid target_type' 


      it 'filters out old notes' 


      context 'confidential issue notes' do
        let(:confidential_issue) { create(:issue, :confidential, project: project, author: user) }
        let!(:confidential_note) { create(:note, noteable: confidential_issue, project: confidential_issue.project) }

        let(:params) { { target_id: confidential_issue.id, target_type: 'issue', last_fetched_at: 1.hour.ago.to_i } }

        it 'returns notes if user can see the issue' 


        it 'raises an error if user can not see the issue' 


        it 'raises an error for project members with guest role' 

      end
    end
  end

  describe '.search' do
    let(:project) { create(:project, :public) }
    let(:note) { create(:note_on_issue, note: 'WoW', project: project) }

    it 'returns notes with matching content' 


    it 'returns notes with matching content regardless of the casing' 


    it 'returns commit notes user can access' 


    context "confidential issues" do
      let(:user) { create(:user) }
      let(:confidential_issue) { create(:issue, :confidential, project: project, author: user) }
      let(:confidential_note) { create(:note, note: "Random", noteable: confidential_issue, project: confidential_issue.project) }

      it "returns notes with matching content if user can see the issue" 


      it "does not return notes with matching content if user can not see the issue" 


      it "does not return notes with matching content for project members with guest role" 


      it "does not return notes with matching content for unauthenticated users" 

    end

    context 'inlines SQL filters on subqueries for performance' do
      let(:sql) { described_class.new(note.project, nil, search: note.note).execute.to_sql }
      let(:number_of_noteable_types) { 4 }

      specify 'project_id check' do
        expect(sql.scan(/project_id/).count).to be >= (number_of_noteable_types + 2)
      end

      specify 'search filter' do
        expect(sql.scan(/LIKE/).count).to be >= number_of_noteable_types
      end
    end
  end

  describe '#target' do
    subject { described_class.new(project, user, params) }

    context 'for a issue target' do
      let(:issue) { create(:issue, project: project) }
      let(:params) { { target_type: 'issue', target_id: issue.id } }

      it 'returns the issue' 

    end

    context 'for a merge request target' do
      let(:merge_request) { create(:merge_request, source_project: project) }
      let(:params) { { target_type: 'merge_request', target_id: merge_request.id } }

      it 'returns the merge_request' 

    end

    context 'for a snippet target' do
      let(:snippet) { create(:project_snippet, project: project) }
      let(:params) { { target_type: 'snippet', target_id: snippet.id } }

      it 'returns the snippet' 

    end

    context 'for a commit target' do
      let(:project) { create(:project, :repository) }
      let(:commit) { project.commit }
      let(:params) { { target_type: 'commit', target_id: commit.id } }

      it 'returns the commit' 

    end
  end
end

