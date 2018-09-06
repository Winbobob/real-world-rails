require 'spec_helper'

describe 'Projects > Show > User interacts with project stars' do
  let(:project) { create(:project, :public, :repository) }

  context 'when user is signed in', :js do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      visit(project_path(project))
    end

    it 'toggles the star' 

  end

  context 'when user is not signed in' do
    before do
      visit(project_path(project))
    end

    it 'does not allow to star a project' 

  end
end

