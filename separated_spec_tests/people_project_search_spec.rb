require 'spec_helper'

describe ProjectSearch do
  describe '#search_potential' do
    let!(:potential_project) { create(:project, potential: true) }
    let!(:other_project) { create(:project, potential: false) }

    it 'returns potential projects when potential is true' 


    it 'returns other projects when potential is false' 

  end

  describe '#search_archived' do
    let!(:archived_project) { create(:project, archived: true) }
    let!(:other_project) { create(:project, archived: false) }

    it 'returns archived projects when archived is true' 


    it 'returns other projects when archived is false' 

  end

  describe '#search_memberships' do
    let!(:project_1) { create(:project) }
    let!(:user) { create(:user) }
    let!(:membership) { create(:membership, user: user, project: project_1) }
    let!(:project_2) { create(:project) }

    it 'returns projects that own the passed memberships' 

  end
end

