require "spec_helper"

describe TodosHelper do
  describe '#todos_count_format' do
    it 'shows fuzzy count for 100 or more items' 


    it 'shows exact count for 99 or fewer items' 

  end

  describe '#todo_projects_options' do
    let(:projects) { create_list(:project, 3) }
    let(:user)     { create(:user) }

    it 'returns users authorised projects in json format' 

  end
end

