require 'spec_helper'

describe 'User searches for projects' do
  let!(:project) { create(:project, :public, name: 'Shop') }

  context 'when signed out' do
    include_examples 'top right search form'

    it 'finds a project' 


    it 'preserves the group being searched in' 


    it 'preserves the project being searched in' 

  end
end

