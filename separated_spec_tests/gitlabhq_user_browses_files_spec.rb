require "spec_helper"

describe "User browses files" do
  let(:fork_message) do
    "You're not allowed to make changes to this project directly. "\
    "A fork of this project has been created that you can make changes in, so you can submit a merge request."
  end
  let(:project) { create(:project, :repository, name: "Shop") }
  let(:project2) { create(:project, :repository, name: "Another Project", path: "another-project") }
  let(:tree_path_root_ref) { project_tree_path(project, project.repository.root_ref) }
  let(:user) { project.owner }

  before do
    sign_in(user)
  end

  it "shows last commit for current directory" 


  context "when browsing the master branch" do
    before do
      visit(tree_path_root_ref)
    end

    it "shows files from a repository" 


    it "shows the `Browse Directory` link" 


    it "shows the `Browse File` link" 


    it "shows the `Browse Files` link" 


    it "redirects to the permalink URL" 

  end

  context "when browsing the `markdown` branch", :js do
    context "when browsing the root" do
      before do
        visit(project_tree_path(project, "markdown"))
      end

      it "shows correct files and links" 


      it "shows correct content of file" 


      it "shows correct content of directory" 

    end
  end

  context "when browsing a specific ref" do
    let(:ref) { project_tree_path(project, "6d39438") }

    before do
      visit(ref)
    end

    it "shows files from a repository for `6d39438`" 


    it "shows files from a repository with apostroph in its name", :js do
      first(".js-project-refs-dropdown").click

      page.within(".project-refs-form") do
        click_link("'test'")
      end

      expect(page).to have_selector(".dropdown-toggle-text", text: "'test'")

      visit(project_tree_path(project, "'test'"))

      expect(page).to have_css(".tree-commit-link").and have_no_content("Loading commit data...")
    end

    it "shows the code with a leading dot in the directory", :js do
      first(".js-project-refs-dropdown").click

      page.within(".project-refs-form") do
        click_link("fix")
      end

      visit(project_tree_path(project, "fix/.testdir"))

      expect(page).to have_css(".tree-commit-link").and have_no_content("Loading commit data...")
    end

    it "does not show the permalink link" 

  end

  context "when browsing a file content" do
    before do
      visit(tree_path_root_ref)

      click_link(".gitignore")
    end

    it "shows a file content", :js do
      expect(page).to have_content("*.rbc")
    end

    it "is possible to blame" 

  end

  context "when browsing a raw file" do
    before do
      path = File.join(RepoHelpers.sample_commit.id, RepoHelpers.sample_blob.path)

      visit(project_blob_path(project, path))
    end

    it "shows a raw file content" 

  end
end

