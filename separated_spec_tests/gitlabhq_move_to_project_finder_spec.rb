require 'spec_helper'

describe MoveToProjectFinder do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  let(:no_access_project) { create(:project) }
  let(:guest_project) { create(:project) }
  let(:reporter_project) { create(:project) }
  let(:developer_project) { create(:project) }
  let(:master_project) { create(:project) }

  subject { described_class.new(user) }

  describe '#execute' do
    context 'filter' do
      it 'does not return projects under Gitlab::Access::REPORTER' 


      it 'returns projects equal or above Gitlab::Access::REPORTER ordered by id in descending order' 


      it 'does not include the source project' 


      it 'does not return archived projects' 


      it 'does not return projects for which issues are disabled' 


      it 'returns a page of projects ordered by id in descending order' 


      it 'returns projects after the given offset id' 

    end

    context 'search' do
      it 'uses Project#search' 


      it 'returns projects matching a search query' 

    end
  end
end

