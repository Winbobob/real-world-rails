require 'spec_helper'

describe BranchesFinder do
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
      it 'filters branches by name' 


      it 'filters branches by name ignoring letter case' 


      it 'does not find any branch with that name' 

    end

    context 'filter and sort' do
      it 'filters branches by name and sorts by recently_updated' 


      it 'filters branches by name and sorts by recently_updated, with exact matches first' 


      it 'filters branches by name and sorts by last_updated' 


      it 'filters branches by name that begins with' 


      it 'filters branches by name that ends with' 

    end
  end
end

