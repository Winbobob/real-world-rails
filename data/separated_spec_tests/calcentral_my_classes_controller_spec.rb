describe MyClassesController do

  before(:each) do
    @user_id = rand(99999).to_s
  end

  it "should be an empty course sites feed on non-authenticated user" 


  it "should be an non-empty course feed on authenticated user" 


  let(:make_request) { get :get_feed }
  it_should_behave_like 'a user authenticated api endpoint'
  it_behaves_like 'an unauthorized endpoint for delegates'
  it_behaves_like 'an unauthorized endpoint for LTI'

  context 'test data', if: CampusOracle::Queries.test_data? do
    subject do
      get :get_feed
      JSON.parse(response.body)
    end
    before do
      allow(Settings.canvas_proxy).to receive(:fake).at_least(:once).and_return(true)
    end
    context 'student in test data' do
      let(:uid) {'300939'}
      it 'returns varied data' 

      context 'advisor view-as' do
        include_context 'advisor view-as'
        it 'filters bCourses sites' 

      end
    end
    context 'instructor in test data' do
      let(:uid) {'238382'}
      let(:instructing_classes) { subject['classes'].select {|c| c['role'] == 'Instructor'} }
      it 'includes instructing classes' 

      context 'advisor view-as' do
        include_context 'advisor view-as'
        it 'filters out instructing classes' 

      end
    end
  end

end

