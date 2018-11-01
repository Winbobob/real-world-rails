require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
  render_views

  let(:valid_attributes) { attributes_for(:announcement) }
  let(:announcement) { create(:announcement) }
  let(:admin) { create(:admin_user, login: 'admin') }

  before do
    login admin
  end

  describe 'GET #index' do
    context 'when there are announcements' do
      let!(:announcements) { create_list(:announcement, 3) }

      subject! { get :index, format: :xml }

      it 'returns a success response' 


      it 'returns all announcements' 

    end

    context 'when there are no announcements' do
      subject! { get :index, format: :xml }

      it 'returns a success response' 


      it 'returns an empty announcements xml' 

    end
  end

  describe 'GET #show' do
    context 'requesting an existing announcement' do
      subject! { get :show, params: { id: announcement } }

      it { is_expected.to have_http_status(:success) }

      it 'responds with the announcement' 

    end

    context 'requesting a non-existing announcement' do
      subject! { get :show, params: { id: 666 }, format: :xml }

      it { is_expected.to have_http_status(:not_found) }

      it 'responds with an error message' 

    end
  end

  describe 'POST create' do
    context 'with valid params' do
      let(:new_announcement) { build(:announcement) }
      let(:new_announcement_xml) { new_announcement.to_xml(Announcement::DEFAULT_RENDER_PARAMS) }

      subject! { post :create, body: new_announcement_xml, format: :xml }

      it 'creates a new Announcement' 


      it 'responds with the created announcement' 

    end

    context 'with invalid params' do
      let(:invalid_announcement_xml) do
        <<~XML
          <announcement>
            <title>My announcement</title>
            <content></content>
          </announcement>
        XML
      end

      subject! { post :create, params: { id: announcement }, body: invalid_announcement_xml, format: :xml }

      it 'returns a with an error' 

    end
  end

  describe 'PUT #update' do
    let(:updated_announcement_xml) do
      announcement.title = 'Changed title'
      announcement.to_xml(Announcement::DEFAULT_RENDER_PARAMS)
    end
    let(:invalid_announcement_xml) do
      <<~XML
        <announcement>
          <title/>
          <content>Terms of Service</content>
        </announcement>
      XML
    end

    context 'with valid params' do
      subject! { put :update, params: { id: announcement }, body: updated_announcement_xml, format: :xml }

      it 'updates the requested announcement' 

    end

    context 'with invalid params' do
      subject! { put :update, params: { id: announcement }, body: invalid_announcement_xml, format: :xml }

      it 'returns an error' 

    end
  end

  describe 'DELETE #destroy' do
    let!(:announcement) { create(:announcement) }

    subject { delete :destroy, params: { id: announcement }, format: :xml }

    it 'destroys the requested announcement' 


    it { is_expected.to have_http_status(:success) }
  end
end

