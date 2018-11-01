require 'spec_helper'

describe Api::V1::MembershipsController do
  render_views
  before { controller.class.skip_before_filter :authenticate_api! }
  let!(:user) { create(:user) }
  let!(:role) { create(:role) }
  let!(:project) { create(:project) }
  let(:membership) { create(:membership, user_id: user.id, project_id: project.id, role_id: role.id) }

  let!(:any_membership) { create(:membership) }
  let(:membership_attrs) do
    attributes_for(:membership).merge(user_id: user.id, project_id: project.id, role_id: role.id)
  end
  let(:rabl_attributes) { [:id, :starts_at, :ends_at, :user_id, :project_id] }

  describe 'GET #index' do
    before do
      get :index, format: :json
    end

    it 'returns 200 code' 


    it 'returns all memberships' 

  end

  describe 'GET #show' do
    before do
      get :show, format: :json, id: membership.id
    end

    it 'returns 200 code' 


    it 'returns correct hash keys' 

  end

  describe 'POST #create' do
    it 'returns 201 code' 


    it 'increments the amount of memberships' 

  end

  describe 'PUT #update' do
    before do
      membership.billable = 1
      put :update, id: membership.id, format: :json, membership: membership.attributes
    end

    it 'returns 204 code' 


    it 'updates the attribute in params' 

  end

  describe 'DELETE #destroy' do
    it 'returns 204 code' 


    it 'decrements the amount of memberships' 

  end
end

