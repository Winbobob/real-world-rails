require 'rails_helper'

describe 'Merge request > User selects branches for new MR', :js do
  let(:project) { create(:project, :public, :repository) }
  let(:user) { project.creator }

  before do
    project.add_master(user)
    sign_in(user)
  end

  it 'selects the source branch sha when a tag with the same name exists' 


  it 'selects the target branch sha when a tag with the same name exists' 


  it 'generates a diff for an orphaned branch' 


  it 'allows filtering multiple dropdowns' 


  context 'when target project cannot be viewed by the current user' do
    it 'does not leak the private project name & namespace' 

  end

  context 'when source project cannot be viewed by the current user' do
    it 'does not leak the private project name & namespace' 

  end

  it 'populates source branch button' 


  it 'allows to change the diff view' 


  it 'does not allow non-existing branches' 


  context 'when a branch contains commits that both delete and add the same image' do
    it 'renders the diff successfully' 

  end

  # Isolates a regression (see #24627)
  it 'does not show error messages on initial form' 


  context 'when a new merge request has a pipeline' do
    let!(:pipeline) do
      create(:ci_pipeline, sha: project.commit('fix').id,
                           ref: 'fix',
                           project: project)
    end

    it 'shows pipelines for a new merge request' 

  end
end

