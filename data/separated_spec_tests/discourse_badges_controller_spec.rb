require 'rails_helper'

describe Admin::BadgesController do

  context "while logged in as an admin" do
    let!(:user) { log_in(:admin) }
    let!(:badge) { Fabricate(:badge) }

    context 'index' do
      it 'returns badge index' 

    end

    context 'preview' do
      it 'allows preview enable_badge_sql is enabled' 

      it 'does not allow anything if enable_badge_sql is disabled' 

    end

    describe '.create' do
      render_views

      it 'can create badges correctly' 

    end

    context '.save_badge_groupings' do

      it 'can save badge groupings' 

    end

    context '.badge_types' do
      it 'returns JSON' 

    end

    context '.destroy' do
      it 'returns success' 


      it 'deletes the badge' 

    end

    context '.update' do

      it 'does not update the name of system badges' 


      it 'does not allow query updates if badge_sql is disabled' 


      it 'updates the badge' 

    end
  end
end

