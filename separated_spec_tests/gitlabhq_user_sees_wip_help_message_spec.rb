require 'rails_helper'

describe 'Merge request > User sees WIP help message' do
  let(:project) { create(:project, :public, :repository) }
  let(:user)    { project.creator }

  before do
    project.add_master(user)
    sign_in(user)
  end

  context 'with WIP commits' do
    it 'shows a specific WIP hint' 

  end

  context 'without WIP commits' do
    it 'shows the regular WIP message' 

  end

  def within_wip_explanation(&block)
    page.within '.js-no-wip-explanation' do
      yield
    end
  end
end

