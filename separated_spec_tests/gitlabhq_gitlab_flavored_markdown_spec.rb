require 'spec_helper'

describe "GitLab Flavored Markdown" do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:issue) { create(:issue, project: project) }
  let(:fred) do
    create(:user, name: 'fred') do |user|
      project.add_master(user)
    end
  end

  before do
    sign_in(user)
    project.add_developer(user)
  end

  describe "for commits" do
    let(:project) { create(:project, :repository) }
    let(:commit) { project.commit }

    before do
      allow_any_instance_of(Commit).to receive(:title)
        .and_return("fix #{issue.to_reference}\n\nask #{fred.to_reference} for details")
    end

    it "renders title in commits#index" 


    it "renders title in commits#show" 


    it "renders description in commits#show" 


    it "renders title in repositories#branches" 

  end

  describe "for issues", :js do
    before do
      @other_issue = create(:issue,
                            author: user,
                            assignees: [user],
                            project: project)
      @issue = create(:issue,
                      author: user,
                      assignees: [user],
                      project: project,
                      title: "fix #{@other_issue.to_reference}",
                      description: "ask #{fred.to_reference} for details")

      @note = create(:note_on_issue, noteable: @issue, project: @issue.project, note: "Hello world")
    end

    it "renders subject in issues#index" 


    it "renders subject in issues#show" 


    it "renders details in issues#show" 

  end

  describe "for merge requests" do
    let(:project) { create(:project, :repository) }

    before do
      @merge_request = create(:merge_request, source_project: project, target_project: project, title: "fix #{issue.to_reference}")
    end

    it "renders title in merge_requests#index" 


    it "renders title in merge_requests#show" 

  end

  describe "for milestones" do
    before do
      @milestone = create(:milestone,
                          project: project,
                          title: "fix #{issue.to_reference}",
                          description: "ask #{fred.to_reference} for details")
    end

    it "renders title in milestones#index" 


    it "renders title in milestones#show" 


    it "renders description in milestones#show" 

  end
end

