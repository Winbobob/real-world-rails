describe CampusSolutions::AdvisingResourcesController do
  let(:user_id) { '12349' }
  let(:feed) { :get }
  it_behaves_like 'an unauthenticated user'

  context 'authenticated user' do
    before do
      session['user_id'] = user_id
      allow(HubEdos::UserAttributes).to receive(:new).with(user_id: user_id).and_return double(get: {campus_solutions_id: random_cs_id, roles: user_roles})
    end

    context 'no advisor privileges' do
      let(:user_roles) { { staff: true, student: true } }
      it 'returns forbidden' 

    end

    context 'advisor privileges' do
      let(:user_roles) { { staff: true, advisor: true } }
      let(:feed_key) { 'ucAdvisingResources' }

      shared_examples 'a feed with advising resources' do
        it 'contains data' 

      end

      context 'links from CS link API' do
        let(:key) { 'ucClassSearch' }
        let(:expected_name) { 'Class Search' }

        it_behaves_like 'a feed with advising resources'

        it 'returns feed with CS links' 

      end

    end
  end

end

