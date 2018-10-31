require 'spec_helper'

describe Admin::BikesController do
  let(:user) { FactoryGirl.create(:admin) }
  before do
    set_current_user(user)
  end

  describe 'index' do
    it 'renders' 

  end

  describe 'duplicates' do
    it 'renders' 

  end

  describe 'edit' do
    let(:bike) { FactoryGirl.create(:stolen_bike) }
    let(:stolen_record) { bike.current_stolen_record }
    context 'standard' do
      it 'renders' 

    end
    context 'with recovery' do
      before { stolen_record.add_recovery_information }
      it 'includes recovery' 

    end
  end

  describe 'destroy' do
    it 'destroys the bike' 

  end

  describe 'update' do
    context 'success' do
      let(:organization) { FactoryGirl.create(:organization) }
      it 'updates the bike and calls update_ownership and serial_normalizer' 

    end

    context 'fast_attr_update' do
      it 'marks a stolen bike recovered and passes attr update through' 

    end

    context 'valid return_to url' do
      it 'redirects' 

    end
  end

  describe 'ignore_duplicate' do
    before do
      request.env['HTTP_REFERER'] = 'http://localhost:3000/admin/bikes/missing_manufacturers'
    end
    context 'marked ignore' do
      it 'duplicates are ignore' 

    end

    context 'duplicate group unignore' do
      it 'marks a duplicate group unignore' 

    end
  end

  describe 'update_manufacturers' do
    before do
      request.env['HTTP_REFERER'] = 'http://localhost:3000/admin/bikes/missing_manufacturers'
    end
    it 'updates the products' 

  end

  describe 'unrecover' do
    let(:bike) { FactoryGirl.create(:stolen_bike) }
    let(:stolen_record) { bike.current_stolen_record }
    let(:recovery_link_token) { stolen_record.find_or_create_recovery_link_token }
    let(:recovered_description) { 'something cool and party and things and stuff and it came back!!! XOXO' }
    before do
      stolen_record.add_recovery_information(recovered_description: recovered_description)
      bike.reload
      expect(bike.stolen).to be_falsey
    end

    it 'marks unrecovered, without deleting the information about the recovery' 

    context 'not matching stolen_record' do
      it 'returns to bike page and renders flash' 

    end
  end
end

