require 'spec_helper'

describe API::ProjectTemplates do
  let(:public_project) { create(:project, :public) }
  let(:private_project) { create(:project, :private) }
  let(:developer) { create(:user) }

  before do
    private_project.add_developer(developer)
  end

  describe 'GET /projects/:id/templates/:type' do
    it 'returns dockerfiles' 


    it 'returns gitignores' 


    it 'returns gitlab_ci_ymls' 


    it 'returns licenses' 


    it 'returns 400 for an unknown template type' 


    it 'denies access to an anonymous user on a private project' 


    it 'permits access to a developer on a private project' 

  end

  describe 'GET /projects/:id/templates/licenses' do
    it 'returns key and name for the listed licenses' 

  end

  describe 'GET /projects/:id/templates/:type/:key' do
    it 'returns a specific dockerfile' 


    it 'returns a specific gitignore' 


    it 'returns a specific gitlab_ci_yml' 


    it 'returns a specific license' 


    it 'returns 404 for an unknown specific template' 


    it 'denies access to an anonymous user on a private project' 


    it 'permits access to a developer on a private project' 

  end

  describe 'GET /projects/:id/templates/licenses/:key' do
    it 'fills placeholders in the license' 

  end
end

