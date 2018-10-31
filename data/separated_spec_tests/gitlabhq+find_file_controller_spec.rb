require 'spec_helper'

describe Projects::FindFileController do
  let(:project) { create(:project, :repository) }
  let(:user)    { create(:user) }

  before do
    sign_in(user)

    project.add_maintainer(user)
    controller.instance_variable_set(:@project, project)
  end

  describe "GET #show" do
    # Make sure any errors accessing the tree in our views bubble up to this spec
    render_views

    before do
      get(:show,
          namespace_id: project.namespace,
          project_id: project,
          id: id)
    end

    context "valid branch" do
      let(:id) { 'master' }
      it { is_expected.to respond_with(:success) }
    end

    context "invalid branch" do
      let(:id) { 'invalid-branch' }
      it { is_expected.to respond_with(:not_found) }
    end
  end

  describe "GET #list" do
    def go(format: 'json')
      get :list,
          namespace_id: project.namespace,
          project_id: project,
          id: id,
          format: format
    end

    context "valid branch" do
      let(:id) { 'master' }
      it 'returns an array of file path list' 

    end

    context "invalid branch" do
      let(:id) { 'invalid-branch' }

      it 'responds with status 404' 

    end
  end
end

