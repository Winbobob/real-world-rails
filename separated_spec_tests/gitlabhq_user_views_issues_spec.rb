require "spec_helper"

describe "User views issues" do
  let!(:closed_issue) { create(:closed_issue, project: project) }
  let!(:open_issue1) { create(:issue, project: project) }
  let!(:open_issue2) { create(:issue, project: project) }
  set(:user) { create(:user) }

  shared_examples "opens issue from list" do
    it "opens issue" 

  end

  shared_examples "open issues" do
    context "open issues" do
      let(:label) { create(:label, project: project, title: "bug") }

      before do
        open_issue1.labels << label

        visit(project_issues_path(project, state: :opened))
      end

      it "shows open issues" 


      it "opens issues by label" 


      include_examples "opens issue from list" do
        let(:issue) { open_issue1 }
      end
    end
  end

  shared_examples "closed issues" do
    context "closed issues" do
      before do
        visit(project_issues_path(project, state: :closed))
      end

      it "shows closed issues" 


      include_examples "opens issue from list" do
        let(:issue) { closed_issue }
      end
    end
  end

  shared_examples "all issues" do
    context "all issues" do
      before do
        visit(project_issues_path(project, state: :all))
      end

      it "shows all issues" 


      include_examples "opens issue from list" do
        let(:issue) { closed_issue }
      end
    end
  end

  %w[internal public].each do |visibility|
    shared_examples "#{visibility} project" do
      context "when project is #{visibility}" do
        let(:project) { create(:project_empty_repo, :"#{visibility}") }

        include_examples "open issues"
        include_examples "closed issues"
        include_examples "all issues"
      end
    end
  end

  context "when signed in as developer" do
    before do
      project.add_developer(user)
      sign_in(user)
    end

    include_examples "public project"
    include_examples "internal project"
  end

  context "when not signed in" do
    include_examples "public project"
  end
end

