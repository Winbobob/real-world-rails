describe MyActivitiesController do

  let(:uid) {random_id}

  it "should be an empty activities feed on non-authenticated user" 


  it "should return a valid activities feed for an authenticated user" 


  # The Activities feed merges so many sources that it would be difficult to
  # explicitly fake them all.
  if ENV['RAILS_ENV'] == 'test'
    context 'using test data' do
      subject do
        get :get_feed
        JSON.parse(response.body)
      end
      it 'returns a varied feed' 


      context 'advisor view-as' do
        include_context 'advisor view-as'
        it 'filters bCourses activities' 

      end
    end

    context 'delegated access' do
      let(:campus_solutions_id) {random_id}
      include_context 'delegated access'
      context 'enrollments-only access' do
        let(:privileges) do
          {
            viewEnrollments: true
          }
        end
        it 'denies all access' 

      end
      context 'financial access' do
        let(:privileges) do
          {
            financial: true
          }
        end
        it 'allows access only to Financial Aid tasks' 

      end
    end

  end

end

