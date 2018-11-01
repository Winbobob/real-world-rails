require 'spec_helper'

describe Members::CreateService do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:project_user) { create(:user) }

  before do
    project.add_maintainer(user)
  end

  it 'adds user to members' 


  it 'adds no user to members' 


  it 'limits the number of users to 100' 

end

