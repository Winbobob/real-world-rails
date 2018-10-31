describe MyGroupsController do

  let(:uid) {random_id}

  it "should be an empty course sites feed on non-authenticated user" 


  it "should check for valid fields on the my groups feed" 


  let(:make_request) { get :get_feed }
  it_should_behave_like 'a user authenticated api endpoint'
  it_behaves_like 'an unauthorized endpoint for delegates'
  it_behaves_like 'an unauthorized endpoint for LTI'

  context 'using test data' do
    subject do
      get :get_feed
      JSON.parse(response.body)
    end
    before do
      allow(Settings.canvas_proxy).to receive(:fake).at_least(:once).and_return(true)
      allow(Settings.cal_link_proxy).to receive(:fake).at_least(:once).and_return(true)
    end
    it 'returns a varied feed' 

    context 'advisor view-as' do
      include_context 'advisor view-as'
      it 'filters bCourses groups' 

    end
  end
end

