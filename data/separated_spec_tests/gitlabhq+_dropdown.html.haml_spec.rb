require 'spec_helper'

describe 'projects/buttons/_dropdown' do
  let(:user) { create(:user) }

  context 'user with all abilities' do
    before do
      assign(:project, project)

      allow(view).to receive(:current_user).and_return(user)
      allow(view).to receive(:can?).with(user, :push_code, project).and_return(true)
      allow(view).to receive(:can_collaborate_with_project?).and_return(true)
    end

    context 'empty repository' do
      let(:project) { create(:project, :empty_repo) }

      it 'has a link to create a new file' 


      it 'does not have a link to create a new branch' 


      it 'does not have a link to create a new tag' 

    end
  end
end

