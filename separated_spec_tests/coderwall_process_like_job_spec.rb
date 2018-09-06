RSpec.describe ProcessLikeJob do

  describe 'queueing' do
    it 'pushes jobs to the correct queue' 

  end

  describe 'processing' do
    let(:user) { Fabricate(:user, tracking_code: 'fake_tracking_code') }
    let(:protip) { Fabricate(:protip) }

    it 'associates the zombie like to the correct user' 


    it 'destroys like that are invalid' 


    it 'destroys likes that are non-unique' 


    it 'destroys likes if no user with the tracking code exists' 

  end

end

