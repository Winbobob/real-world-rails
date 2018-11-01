require 'spec_helper'

describe Projects::GroupLinks::DestroyService, '#execute' do
  let(:group_link) { create :project_group_link }
  let(:project) { group_link.project }
  let(:user) { create :user }
  let(:subject) { described_class.new(project, user) }

  it 'removes group from project' 


  it 'returns false if group_link is blank' 

end

