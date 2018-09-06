require 'spec_helper'

describe "Commits", feature: true do
  context "Authenticated user" do
    before do
      login_as :user
      @project = FactoryGirl.create :project
      @commit = FactoryGirl.create :commit, project: @project
      @build = FactoryGirl.create :build, commit: @commit
    end

    describe "GET /:project/commits/:sha" do
      before do
        visit project_ref_commit_path(@project, @commit.ref, @commit.sha)
      end

      it { expect(page).to have_content @commit.sha[0..7] }
      it { expect(page).to have_content @commit.git_commit_message }
      it { expect(page).to have_content @commit.git_author_name }
    end

    describe "Cancel commit" do
      it "cancels commit" 

    end

    describe ".gitlab-ci.yml not found warning" do
      it "does not show warning" 


      it "shows warning" 

    end
  end

  context "Public pages" do
    before do
      @project = FactoryGirl.create :public_project
      @commit = FactoryGirl.create :commit, project: @project
      @build = FactoryGirl.create :build, commit: @commit
    end

    describe "GET /:project/commits/:sha" do
      before do
        visit project_ref_commit_path(@project, @commit.ref, @commit.sha)
      end

      it { expect(page).to have_content @commit.sha[0..7] }
      it { expect(page).to have_content @commit.git_commit_message }
      it { expect(page).to have_content @commit.git_author_name }
    end
  end
end
