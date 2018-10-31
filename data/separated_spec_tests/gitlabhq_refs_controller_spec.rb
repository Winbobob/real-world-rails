require 'spec_helper'

describe Projects::RefsController do
  let(:project) { create(:project, :repository) }
  let(:user)    { create(:user) }

  before do
    sign_in(user)
    project.add_developer(user)
  end

  describe 'GET #logs_tree' do
    def default_get(format = :html)
      get :logs_tree,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: 'master',
          path: 'foo/bar/baz.html',
          format: format
    end

    def xhr_get(format = :html)
      xhr :get,
          :logs_tree,
          namespace_id: project.namespace.to_param,
          project_id: project,
          id: 'master',
          path: 'foo/bar/baz.html',
          format: format
    end

    it 'never throws MissingTemplate' 


    it 'renders 404 for non-JS requests' 


    it 'renders JS' 


    it 'renders JSON' 

  end
end

