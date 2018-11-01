require('spec_helper')

describe Projects::ProtectedTagsController do
  describe "GET #index" do
    let(:project) { create(:project_empty_repo, :public) }

    it "redirects empty repo to projects page" 

  end

  describe "DELETE #destroy" do
    let(:project) { create(:project, :repository) }
    let(:protected_tag) { create(:protected_tag, :developers_can_create, project: project) }
    let(:user) { create(:user) }

    before do
      project.add_maintainer(user)
      sign_in(user)
    end

    it "deletes the protected tag" 

  end
end

