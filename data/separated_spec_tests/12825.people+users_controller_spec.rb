require 'spec_helper'
describe Api::V1::UsersController do
  render_views
  before { controller.class.skip_before_filter :authenticate_api! }

  let!(:user) { create(:user) }
  let(:user_keys) { %w(id first_name last_name email archived gh_nick employment role contract_type
    memberships abilities) }

  let!(:junior) { create(:role, name: 'junior') }
  let!(:developer) { create(:role, name: 'developer') }
  let!(:senior) { create(:role, name: 'senior') }

  let!(:membership1) { create(:membership, user: user, role: junior) }

  let!(:membership2) { create(:membership, user: user, role: developer) }
  let!(:membership3) { create(:membership,
                             user: user,
                             role: senior,
                             project: membership2.project,
                             starts_at: membership2.ends_at + 1.day,
                             ends_at: membership2.ends_at + 2.days) }

  describe "GET #index" do

    before do
      get :index, format: :json
      @json_response = JSON.parse(response.body)
    end

    it "returns 200 code" 


    it 'contains current user fields' 


    context 'in each membership' do
      subject { @json_response[0]['memberships'] }

      it 'includes last user role' 

    end
  end

  shared_examples_for "GET #show" do |attribute|
    describe "using #{attribute}" do
      before do
        execute_request
        @json_response = JSON.parse(response.body)
      end

      it "returns 200 code" 


      it "contains current_week fields" 

    end
  end

  it_should_behave_like "GET #show", :id do
    let!(:execute_request) { get :show, id: user.id, format: :json }
  end
  it_should_behave_like "GET #show", :email do
    let!(:execute_request) { get :show, id: 1, email: user.email, format: :json }
  end
end

