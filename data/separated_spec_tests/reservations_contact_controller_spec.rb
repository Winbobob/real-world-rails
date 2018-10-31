# frozen_string_literal: true

require 'spec_helper'

describe ContactController, type: :controller do
  before(:each) do
    @category = FactoryGirl.create(:category)
    sign_in FactoryGirl.create(:user)

    # goes after the above to skip certain user validations
    @ac = mock_app_config(contact_email: 'contact@email.com',
                          admin_email: 'admin@email.com',
                          site_title: 'Reservations Specs')
  end
  describe 'GET new' do
    before(:each) do
      get :new
    end
    it 'should assign @message to a new message' 

    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:new) }
    it { is_expected.not_to set_flash }
  end
  describe 'POST create' do
    before(:each) do
      ActionMailer::Base.deliveries = nil
    end
    context 'with valid attributes' do
      before(:each) do
        post :create, params: { message: FactoryGirl.attributes_for(:message) }
      end
      it 'sends a message' 

      it { is_expected.to redirect_to(root_path) }
      it { is_expected.to set_flash }
    end
    context 'with invalid attributes' do
      before(:each) do
        attrs = FactoryGirl.attributes_for(:message, name: nil)
        post :create, params: { message: attrs }
      end
      it { is_expected.to render_template(:new) }
      it { is_expected.to set_flash }
      it 'should not send a message' 

    end
  end
  context 'with contact e-mail set' do
    before do
      allow(@ac).to receive(:contact_link_location)
        .and_return('contact@example.com')
      post :create, params: { message: FactoryGirl.attributes_for(:message) }
    end

    it 'sends the message to the contact address' 

  end
  context 'with contact e-mail not set' do
    before do
      allow(@ac).to receive(:contact_link_location).and_return('')
      post :create, params: { message: FactoryGirl.attributes_for(:message) }
    end

    it 'sends the message to the admin address' 

  end
end

