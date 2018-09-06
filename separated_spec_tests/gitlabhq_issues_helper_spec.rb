require "spec_helper"

describe IssuesHelper do
  let(:project) { create(:project) }
  let(:issue) { create :issue, project: project }
  let(:ext_project) { create :redmine_project }

  describe "url_for_issue" do
    let(:issues_url) { ext_project.external_issue_tracker.issues_url}
    let(:ext_expected) { issues_url.gsub(':id', issue.iid.to_s).gsub(':project_id', ext_project.id.to_s) }
    let(:int_expected) { polymorphic_path([@project.namespace, @project, issue]) }

    it "returns internal path if used internal tracker" 


    it "returns path to external tracker" 


    it "returns path to internal issue when internal option passed" 


    it "returns empty string if project nil" 


    it 'returns an empty string if issue_url is invalid' 


    it 'returns an empty string if issue_path is invalid' 


    describe "when external tracker was enabled and then config removed" do
      before do
        @project = ext_project
        allow(Gitlab.config).to receive(:issues_tracker).and_return(nil)
      end

      it "returns external path" 

    end
  end

  describe '#award_user_list' do
    it "returns a comma-separated list of the first X users" 


    it "displays the current user's name as 'You'" 


    it "truncates lists" 


    it "displays the current user in front of other users" 

  end

  describe '#award_state_class' do
    let!(:upvote) { create(:award_emoji) }
    let(:awardable) { upvote.awardable }
    let(:user) { upvote.user }

    before do
      allow(helper).to receive(:can?) do |*args|
        Ability.allowed?(*args)
      end
    end

    it "returns disabled string for unauthenticated user" 


    it "returns disabled for a user that does not have access to the awardable" 


    it "returns active string for author" 


    it "is blank for a user that has access to the awardable" 

  end

  describe "awards_sort" do
    it "sorts a hash so thumbsup and thumbsdown are always on top" 

  end

  describe "#link_to_discussions_to_resolve" do
    describe "passing only a merge request" do
      let(:merge_request) { create(:merge_request) }

      it "links just the merge request" 


      it "containst the reference to the merge request" 

    end

    describe "when passing a discussion" do
      let(:diff_note) {  create(:diff_note_on_merge_request) }
      let(:merge_request) { diff_note.noteable }
      let(:discussion) { diff_note.to_discussion }

      it "links to the merge request with first note if a single discussion was passed" 


      it "contains both the reference to the merge request and a mention of the discussion" 

    end
  end

  describe '#show_new_issue_link?' do
    before do
      allow(helper).to receive(:current_user)
    end

    it 'is false when no project there is no project' 


    it 'is true when there is a project and no logged in user' 


    it 'is true when the current user does not have access to the project' 

  end
end

