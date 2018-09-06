require 'spec_helper'

describe 'Projects > Settings > User manages project members' do
  let(:group) { create(:group, name: 'OpenSource') }
  let(:project) { create(:project) }
  let(:project2) { create(:project) }
  let(:user) { create(:user) }
  let(:user_dmitriy) { create(:user, name: 'Dmitriy') }
  let(:user_mike) { create(:user, name: 'Mike') }

  before do
    project.add_master(user)
    project.add_developer(user_dmitriy)
    sign_in(user)
  end

  it 'cancels a team member' 


  it 'imports a team from another project' 


  it 'shows all members of project shared group' 

end

