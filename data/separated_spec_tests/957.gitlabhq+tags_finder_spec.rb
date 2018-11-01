require 'spec_helper'

describe TagsFinder do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }

  describe '#execute' do
    context 'sort only' do
      it 'sorts by name' 


      it 'sorts by recently_updated' 


      it 'sorts by last_updated' 

    end

    context 'filter only' do
      it 'filters tags by name' 


      it 'does not find any tags with that name' 

    end

    context 'filter and sort' do
      it 'filters tags by name and sorts by recently_updated' 


      it 'filters tags by name and sorts by last_updated' 

    end
  end
end

