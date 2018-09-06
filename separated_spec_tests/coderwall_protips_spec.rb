RSpec.describe 'Viewing a protip', type: :request do

  describe 'when user coming from topic page' do
    let(:topic) { 'Ruby' }

    before :each do
      Protip.rebuild_index
      @protip1 = Fabricate(:protip, topics: topic, user: Fabricate(:user))
      @protip2 = Fabricate(:protip, topics: topic, user: Fabricate(:user))
      @protip3 = Fabricate(:protip, topics: topic, user: Fabricate(:user))
    end

    it 'returns them to the topic page when they use :back', skip: 'obsolete?' 


    it 'has a link that takes them to next protip in topic page if there is one', search: true, skip: 'obsolete?' 

  end

end

