require 'spec_helper'

describe PaginationHelper do
  describe '#paginate_collection' do
    let(:collection) { User.all.page(1) }

    it 'paginates a collection without using a COUNT' 


    it 'paginates a collection using a COUNT' 

  end
end

