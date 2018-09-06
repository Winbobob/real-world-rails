require "spec_helper"

describe "User browses artifacts" do
  let(:project) { create(:project, :public) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project) }
  let(:job) { create(:ci_build, :artifacts, pipeline: pipeline) }
  let(:browse_url) { browse_project_job_artifacts_path(project, job, "other_artifacts_0.1.2") }

  context "when visiting old URL" do
    it "redirects to new URL" 

  end

  context "when browsing artifacts root directory" do
    before do
      visit(browse_project_job_artifacts_path(project, job))
    end

    it "shows artifacts" 


    it "shows an artifact" 

  end

  context "when browsing a directory with UTF-8 characters in its name" do
    before do
      visit(browse_project_job_artifacts_path(project, job))
    end

    it "shows correct content", :js do
      page.within(".tree-table") do
        click_link("tests_encoding")

        expect(page).to have_no_content("non-utf8-dir")

        click_link("utf8 test dir ✓")

        expect(page).to have_content("..").and have_content("regular_file_2")
      end
    end
  end

  context "when browsing a directory with a text file" do
    let(:txt_entry) { job.artifacts_metadata_entry("other_artifacts_0.1.2/doc_sample.txt") }

    before do
      allow(Gitlab.config.pages).to receive(:enabled).and_return(true)
      allow(Gitlab.config.pages).to receive(:artifacts_server).and_return(true)
    end

    context "when the project is public" do
      before do
        visit(browse_url)
      end

      it "shows correct content" 

    end

    context "when the project is private" do
      let!(:private_project) { create(:project, :private) }
      let(:pipeline) { create(:ci_empty_pipeline, project: private_project) }
      let(:job) { create(:ci_build, :artifacts, pipeline: pipeline) }
      let(:user) { create(:user) }

      before do
        private_project.add_developer(user)

        sign_in(user)

        visit(browse_project_job_artifacts_path(private_project, job, "other_artifacts_0.1.2"))
      end

      it { expect(page).to have_link("doc_sample.txt").and have_no_selector(".js-artifact-tree-external-icon") }
    end
  end
end

