# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'integration/alaveteli_dsl'

describe "administering requests" do

  before :all do
    get_fixtures_xapian_index
  end

  context 'when the admin user is a pro' do
    let!(:pro_admin_user) do
      pro_user = FactoryBot.create(:pro_user)
      pro_user.add_role :admin
      pro_user
    end
    let!(:pro_admin_user_session) { login(pro_admin_user) }

    context 'when the user being administered is not a pro' do
      let!(:public_body) do
        FactoryBot.create(:public_body,
                          :name => 'example')
      end

      before do
        update_xapian_index
      end

      context "the admin user visits the non admin user's confirmation link" do
        it 'confirms the request' 

      end

    end

  end

end

