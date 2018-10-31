require 'spec_helper'

describe GitlabSchema.types['Project'] do
  it { expect(described_class).to expose_permissions_using(Types::PermissionTypes::Project) }

  it { expect(described_class.graphql_name).to eq('Project') }

  describe 'nested merge request' do
    it { expect(described_class).to have_graphql_field(:merge_request) }

    it 'authorizes the merge request' 

  end

  it { is_expected.to have_graphql_field(:pipelines) }
end

