require 'rails_helper'

describe Admin::BadgesController do
  context "while logged in as an admin" do
    let(:admin) { Fabricate(:admin) }
    let!(:badge) { Fabricate(:badge) }

    before do
      sign_in(admin)
    end

    describe '#index' do
      it 'returns badge index' 

    end

    describe '#preview' do
      it 'allows preview enable_badge_sql is enabled' 


      it 'does not allow anything if enable_badge_sql is disabled' 

    end

    describe '#create' do
      it 'can create badges correctly' 

    end

    describe '#save_badge_groupings' do
      it 'can save badge groupings' 

    end

    describe '#badge_types' do
      it 'returns JSON' 

    end

    describe '#destroy' do
      it 'deletes the badge' 

    end

    describe '#update' do
      it 'does not update the name of system badges' 


      it 'does not allow query updates if badge_sql is disabled' 


      it 'updates the badge' 

    end
  end
end

