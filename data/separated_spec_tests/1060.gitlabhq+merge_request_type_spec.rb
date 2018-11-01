require 'spec_helper'

describe GitlabSchema.types['MergeRequest'] do
  it { expect(described_class).to expose_permissions_using(Types::PermissionTypes::MergeRequest) }

  describe 'head pipeline' do
    it 'has a head pipeline field' 


    it 'authorizes the field' 

  end
end

