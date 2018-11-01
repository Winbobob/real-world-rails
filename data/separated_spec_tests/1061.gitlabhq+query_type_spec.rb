require 'spec_helper'

describe GitlabSchema.types['Query'] do
  it 'is called Query' 


  it { is_expected.to have_graphql_fields(:project, :echo) }

  describe 'project field' do
    subject { described_class.fields['project'] }

    it 'finds projects by full path' 


    it 'authorizes with read_project' 

  end
end

