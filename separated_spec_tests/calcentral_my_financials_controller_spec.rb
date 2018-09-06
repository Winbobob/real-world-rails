describe MyFinancialsController do

  before(:each) do
    @user_id = rand(99999).to_s
  end

  it "should be an empty financials feed on non-authenticated user" 


  it "should be an non-empty financials feed on authenticated user" 


  context 'delegated access' do
    let(:uid) {random_id}
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
      it 'allows access' 

    end
  end

end

