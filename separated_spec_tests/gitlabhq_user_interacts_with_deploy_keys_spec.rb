require "spec_helper"

describe "User interacts with deploy keys", :js do
  let(:project) { create(:project, :repository) }
  let(:user) { project.owner }

  before do
    sign_in(user)
  end

  shared_examples "attaches a key" do
    it "attaches key" 

  end

  context "viewing deploy keys" do
    let(:deploy_key) { create(:deploy_key) }

    context "when project has keys" do
      before do
        create(:deploy_keys_project, project: project, deploy_key: deploy_key)
      end

      it "shows deploy keys" 

    end

    context "when another project has keys" do
      let(:another_project) { create(:project) }

      before do
        create(:deploy_keys_project, project: another_project, deploy_key: deploy_key)

        another_project.add_master(user)
      end

      it "shows deploy keys" 

    end

    context "when there are public deploy keys" do
      let!(:deploy_key) { create(:deploy_key, public: true) }

      it "shows public deploy keys" 

    end
  end

  context "adding deploy keys" do
    before do
      visit(project_deploy_keys_path(project))
    end

    it "adds new key" 

  end

  context "attaching existing keys" do
    context "from another project" do
      let(:another_project) { create(:project) }
      let(:deploy_key) { create(:deploy_key) }

      before do
        create(:deploy_keys_project, project: another_project, deploy_key: deploy_key)

        another_project.add_master(user)
      end

      it_behaves_like "attaches a key"
    end

    context "when keys are public" do
      let!(:deploy_key) { create(:deploy_key, public: true) }

      it_behaves_like "attaches a key"
    end
  end
end

