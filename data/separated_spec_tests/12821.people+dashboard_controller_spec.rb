require 'spec_helper'

describe DashboardController do
  before(:each) do
    sign_in create(:user, first_name: 'Marian')
  end

  describe '#index' do
    let!(:old_membership) { create(:membership, ends_at: 1.day.ago) }
    let!(:new_membership) { create(:membership, ends_at: 1.day.from_now) }
    let!(:archived_membership) { create(:membership, ends_at: 1.day.from_now, project_archived: true) }

    before { get :index }

    it 'responds successfully with an HTTP 200 status code' 


    describe 'exposing unfinished memberships' do
      it 'exposes unfinished memberships' 


      it "doesn't expose finished and archived memebrships" 

    end
  end
end

