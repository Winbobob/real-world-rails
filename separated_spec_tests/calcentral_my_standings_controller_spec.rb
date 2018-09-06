describe MyStandingsController do
  before do
    allow_any_instance_of(EdoOracle::Queries).to receive(:get_academic_standings).and_return({})
  end

  let(:user_id) { random_id }

  describe '#get_feed' do
    let(:feed) { :get_feed }

    it_behaves_like 'an unauthenticated user'

    it 'should get a non-empty feed for an authenticated (but fake) user' 

  end
end

