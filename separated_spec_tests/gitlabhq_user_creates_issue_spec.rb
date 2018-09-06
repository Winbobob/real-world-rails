require "spec_helper"

describe "User creates issue" do
  let(:project) { create(:project_empty_repo, :public) }
  let(:user) { create(:user) }

  context "when signed in as guest" do
    before do
      project.add_guest(user)
      sign_in(user)

      visit(new_project_issue_path(project))
    end

    it "creates issue" 

  end

  context "when signed in as developer", :js do
    before do
      project.add_developer(user)
      sign_in(user)

      visit(new_project_issue_path(project))
    end

    context "when previewing" do
      it "previews content" 

    end

    context "with labels" do
      LABEL_TITLES = %w(bug feature enhancement).freeze

      before do
        LABEL_TITLES.each do |title|
          create(:label, project: project, title: title)
        end
      end

      it "creates issue" 

    end
  end
end

