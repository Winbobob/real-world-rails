require 'spec_helper'

describe Gitlab::MultiCollectionPaginator do
  subject(:paginator) { described_class.new(Project.all.order(:id), Group.all.order(:id), per_page: 3) }

  it 'combines both collections' 


  it 'includes elements second collection if first collection is empty' 


  context 'with a full first page' do
    let!(:all_groups) { create_list(:group, 4) }
    let!(:all_projects) { create_list(:project, 4) }

    it 'knows the total count of the collection' 


    it 'fills the first page with elements of the first collection' 


    it 'fils the second page with a mixture of of the first & second collection' 


    it 'fils the last page with elements from the second collection' 

  end
end

