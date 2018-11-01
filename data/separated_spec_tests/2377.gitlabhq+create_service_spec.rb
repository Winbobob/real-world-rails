require 'spec_helper'

describe Projects::GroupLinks::CreateService, '#execute' do
  let(:user) { create :user }
  let(:group) { create :group }
  let(:project) { create :project }
  let(:opts) do
    {
      link_group_access: '30',
      expires_at: nil
    }
  end
  let(:subject) { described_class.new(project, user, opts) }

  it 'adds group to project' 


  it 'returns false if group is blank' 

end

