require 'spec_helper'

describe Projects::ReleasesController do
  let!(:project) { create(:project, :repository) }
  let!(:user)    { create(:user) }
  let!(:release) { create(:release, project: project) }
  let!(:tag)     { release.tag }

  before do
    project.add_developer(user)
    sign_in(user)
  end

  describe 'GET #edit' do
    it 'initializes a new release' 


    it 'retrieves an existing release' 

  end

  describe 'PUT #update' do
    it 'updates release note description' 


    it 'deletes release note when description is null' 

  end

  def update_release(description)
    put :update,
      namespace_id: project.namespace.to_param,
      project_id: project,
      tag_id: release.tag,
      release: { description: description }
  end
end

