require 'spec_helper'

describe "Admin Builds", feature: true do
  let(:project) { FactoryGirl.create :project }
  let(:commit) { FactoryGirl.create :commit, project: project }
  let(:build) { FactoryGirl.create :build, commit: commit }

  before do
    skip_admin_auth
    login_as :user
  end

  describe "GET /admin/builds" do
    before do
      build
      visit admin_builds_path
    end

    it { expect(page).to have_content "All builds" }
    it { expect(page).to have_content build.short_sha }
  end

  describe "Tabs" do
    it "shows all builds" 


    it "shows pending builds" 


    it "shows running builds" 

  end
end

