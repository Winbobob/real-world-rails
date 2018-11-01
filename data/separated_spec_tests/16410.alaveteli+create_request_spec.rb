# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'integration/alaveteli_dsl'

describe "When creating requests" do

  before :all do
    get_fixtures_xapian_index
  end

  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:public_body) { FactoryBot.create(:public_body, name: 'example') }
  let!(:admin_user_session) { login(admin_user) }

  before do
    update_xapian_index
  end

  it 'associates the request with the requestor, even if it is approved by an admin' 


  context 'the authority name contains an apostrophe' do

    let(:user) { FactoryBot.create(:user) }
    let(:user_session) { login(user) }
    let(:public_body) do
      FactoryBot.create(:public_body, name: "Test's Authority <b>test</b>")
    end

    it 'does not HTML escape the apostrophe in the request form' 


    it 'appends the user name' 


    it 'handles other special characters correctly' 


    it 'does not render authority name HTML on the preview page' 


  end

end

