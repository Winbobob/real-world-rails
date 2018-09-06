require 'spec_helper'

describe Admin::StolenNotificationsController do
  describe 'index' do
    before do
      user = FactoryGirl.create(:admin)
      set_current_user(user)
      get :index
    end
    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:index) }
    it { is_expected.not_to set_flash }
  end

  describe 'show' do
    before do
      stolen_notification = FactoryGirl.create(:stolen_notification)
      user = FactoryGirl.create(:admin)
      set_current_user(user)
      get :show, id: stolen_notification.id
    end
    it { is_expected.to respond_with(:success) }
    it { is_expected.to render_template(:show) }
    it { is_expected.not_to set_flash }
  end

  describe 'resend' do
    it 'resends the stolen notification' 


    it 'redirects if the stolen notification has already been sent' 


    it 'resends if the stolen notification has already been sent if we say pretty please' 

  end
end

