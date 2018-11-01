require 'rails_helper'

RSpec.describe 'users/deleted', type: :view do
  let!(:user) { create :user, deleted_at: Time.zone.now }

  describe 'when viewed' do
    context 'as an admin' do
      let(:admin) { create :admin_user }
      before do
        create_list(:user, 2, deleted_at: Time.zone.now)
        assign(:users, User.only_deleted)
        sign_in admin
        render
      end

      it 'renders a link to the user index page' 


      it 'shows users email addresses' 


      it 'has links to restore users' 

    end
  end
end

