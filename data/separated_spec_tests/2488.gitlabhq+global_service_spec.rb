require 'spec_helper'

describe Search::GlobalService do
  let(:user) { create(:user) }
  let(:internal_user) { create(:user) }

  let!(:found_project)    { create(:project, :private, name: 'searchable_project') }
  let!(:unfound_project)  { create(:project, :private, name: 'unfound_project') }
  let!(:internal_project) { create(:project, :internal, name: 'searchable_internal_project') }
  let!(:public_project)   { create(:project, :public, name: 'searchable_public_project') }

  before do
    found_project.add_maintainer(user)
  end

  describe '#execute' do
    context 'unauthenticated' do
      it 'returns public projects only' 

    end

    context 'authenticated' do
      it 'returns public, internal and private projects' 


      it 'returns only public & internal projects' 


      it 'project name is searchable' 

    end
  end
end

