RSpec.describe ProtipIndexer, skip: true do
  before(:all) { Protip.rebuild_index }
  describe '#store' do
    it 'should add a users protip to the search index' 


    it 'should not add a users protip to search index if user is banned' 

  end

  describe '#remove' do
    it 'should remove a users protip from search index' 

  end
end

