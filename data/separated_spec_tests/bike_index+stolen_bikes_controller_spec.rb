require 'spec_helper'

describe Admin::StolenBikesController do
  let(:user) { FactoryGirl.create(:admin) }
  before do
    set_current_user(user)
  end

  describe 'index' do
    it 'renders' 

  end

  describe 'edit' do
    let(:bike) { FactoryGirl.create(:stolen_bike) }
    let(:stolen_record) { bike.current_stolen_record }
    it 'renders' 

  end

  describe 'update' do
    context 'success' do
      it 'updates the bike and calls update_ownership and serial_normalizer' 

    end
  end
end

