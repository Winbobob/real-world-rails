# coding: utf-8
require 'spec_helper'

describe Gitlab::ProjectSearchResults do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:query) { 'hello world' }

  describe 'initialize with empty ref' do
    let(:results) { described_class.new(user, project, query, '') }

    it { expect(results.project).to eq(project) }
    it { expect(results.query).to eq('hello world') }
  end

  describe 'initialize with ref' do
    let(:ref) { 'refs/heads/test' }
    let(:results) { described_class.new(user, project, query, ref) }

    it { expect(results.project).to eq(project) }
    it { expect(results.repository_ref).to eq(ref) }
    it { expect(results.query).to eq('hello world') }
  end

  describe 'blob search' do
    let(:project) { create(:project, :public, :repository) }

    subject(:results) { described_class.new(user, project, 'files').objects('blobs') }

    context 'when repository is disabled' do
      let(:project) { create(:project, :public, :repository, :repository_disabled) }

      it 'hides blobs from members' 


      it 'hides blobs from non-members' 

    end

    context 'when repository is internal' do
      let(:project) { create(:project, :public, :repository, :repository_private) }

      it 'finds blobs for members' 


      it 'hides blobs from non-members' 

    end

    it 'finds by name' 


    it 'finds by content' 


    describe 'parsing results' do
      let(:results) { project.repository.search_files_by_content('feature', 'master') }
      let(:search_result) { results.first }

      subject { described_class.parse_search_result(search_result) }

      it "returns a valid FoundBlob" 


      context 'when the matching filename contains a colon' do
        let(:search_result) { "master:testdata/project::function1.yaml\x001\x00---\n" }

        it 'returns a valid FoundBlob' 

      end

      context 'when the matching content contains a number surrounded by colons' do
        let(:search_result) { "master:testdata/foo.txt\x001\x00blah:9:blah" }

        it 'returns a valid FoundBlob' 

      end

      context 'when the search result ends with an empty line' do
        let(:results) { project.repository.search_files_by_content('Role models', 'master') }

        it 'returns a valid FoundBlob that ends with an empty line' 

      end

      context 'when the search returns non-ASCII data' do
        context 'with UTF-8' do
          let(:results) { project.repository.search_files_by_content('файл', 'master') }

          it 'returns results as UTF-8' 

        end

        context 'with UTF-8 in the filename' do
          let(:results) { project.repository.search_files_by_content('webhook', 'master') }

          it 'returns results as UTF-8' 

        end

        context 'with ISO-8859-1' do
          let(:search_result) { "master:encoding/iso8859.txt\x001\x00\xC4\xFC\nmaster:encoding/iso8859.txt\x002\x00\nmaster:encoding/iso8859.txt\x003\x00foo\n".force_encoding(Encoding::ASCII_8BIT) }

          it 'returns results as UTF-8' 

        end
      end

      context "when filename has extension" do
        let(:search_result) { "master:CONTRIBUTE.md\x005\x00- [Contribute to GitLab](#contribute-to-gitlab)\n" }

        it { expect(subject.path).to eq('CONTRIBUTE.md') }
        it { expect(subject.filename).to eq('CONTRIBUTE.md') }
        it { expect(subject.basename).to eq('CONTRIBUTE') }
      end

      context "when file under directory" do
        let(:search_result) { "master:a/b/c.md\x005\x00a b c\n" }

        it { expect(subject.path).to eq('a/b/c.md') }
        it { expect(subject.filename).to eq('a/b/c.md') }
        it { expect(subject.basename).to eq('a/b/c') }
      end
    end
  end

  describe 'wiki search' do
    let(:project) { create(:project, :public, :wiki_repo) }
    let(:wiki) { build(:project_wiki, project: project) }
    let!(:wiki_page) { wiki.create_page('Title', 'Content') }

    subject(:results) { described_class.new(user, project, 'Content').objects('wiki_blobs') }

    context 'when wiki is disabled' do
      let(:project) { create(:project, :public, :wiki_repo, :wiki_disabled) }

      it 'hides wiki blobs from members' 


      it 'hides wiki blobs from non-members' 

    end

    context 'when wiki is internal' do
      let(:project) { create(:project, :public, :wiki_repo, :wiki_private) }

      it 'finds wiki blobs for guest' 


      it 'hides wiki blobs from non-members' 

    end

    it 'finds by content' 

  end

  it 'does not list issues on private projects' 


  describe 'confidential issues' do
    let(:query) { 'issue' }
    let(:author) { create(:user) }
    let(:assignee) { create(:user) }
    let(:non_member) { create(:user) }
    let(:member) { create(:user) }
    let(:admin) { create(:admin) }
    let(:project) { create(:project, :internal) }
    let!(:issue) { create(:issue, project: project, title: 'Issue 1') }
    let!(:security_issue_1) { create(:issue, :confidential, project: project, title: 'Security issue 1', author: author) }
    let!(:security_issue_2) { create(:issue, :confidential, title: 'Security issue 2', project: project, assignees: [assignee]) }

    it 'does not list project confidential issues for non project members' 


    it 'does not list project confidential issues for project members with guest role' 


    it 'lists project confidential issues for author' 


    it 'lists project confidential issues for assignee' 


    it 'lists project confidential issues for project members' 


    it 'lists all project issues for admin' 

  end

  describe 'notes search' do
    it 'lists notes' 


    it "doesn't list issue notes when access is restricted" 


    it "doesn't list merge_request notes when access is restricted" 

  end

  describe '#limited_notes_count' do
    let(:project) { create(:project, :public) }
    let(:note) { create(:note_on_issue, project: project) }
    let(:results) { described_class.new(user, project, note.note) }

    context 'when count_limit is lower than total amount' do
      before do
        allow(results).to receive(:count_limit).and_return(1)
      end

      it 'calls note finder once to get the limited amount of notes' 

    end

    context 'when count_limit is higher than total amount' do
      it 'calls note finder multiple times to get the limited amount of notes' 

    end
  end

  # Examples for commit access level test
  #
  # params:
  # * search_phrase
  # * commit
  #
  shared_examples 'access restricted commits' do
    context 'when project is internal' do
      let(:project) { create(:project, :internal, :repository) }

      it 'does not search if user is not authenticated' 


      it 'searches if user is authenticated' 

    end

    context 'when project is private' do
      let!(:creator) { create(:user, username: 'private-project-author') }
      let!(:private_project) { create(:project, :private, :repository, creator: creator, namespace: creator.namespace) }
      let(:team_master) do
        user = create(:user, username: 'private-project-master')
        private_project.add_master(user)
        user
      end
      let(:team_reporter) do
        user = create(:user, username: 'private-project-reporter')
        private_project.add_reporter(user)
        user
      end

      it 'does not show commit to stranger' 


      context 'team access' do
        it 'shows commit to creator' 


        it 'shows commit to master' 


        it 'shows commit to reporter' 

      end
    end
  end

  describe 'commit search' do
    context 'by commit message' do
      let(:project) { create(:project, :public, :repository) }
      let(:commit) { project.repository.commit('59e29889be61e6e0e5e223bfa9ac2721d31605b8') }
      let(:message) { 'Sorry, I did a mistake' }

      it 'finds commit by message' 


      it 'handles when no commit match' 


      it_behaves_like 'access restricted commits' do
        let(:search_phrase) { message }
        let(:commit) { project.repository.commit('59e29889be61e6e0e5e223bfa9ac2721d31605b8') }
      end
    end

    context 'by commit hash' do
      let(:project) { create(:project, :public, :repository) }
      let(:commit) { project.repository.commit('0b4bc9a') }

      commit_hashes = { short: '0b4bc9a', full: '0b4bc9a49b562e85de7cc9e834518ea6828729b9' }

      commit_hashes.each do |type, commit_hash|
        it "shows commit by #{type} hash id" 

      end

      it 'handles not existing commit hash correctly' 


      it_behaves_like 'access restricted commits' do
        let(:search_phrase) { '0b4bc9a49' }
        let(:commit) { project.repository.commit('0b4bc9a') }
      end
    end
  end
end

