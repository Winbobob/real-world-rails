# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe 'Editing a User' do
  before do
    allow(AlaveteliConfiguration).to receive(:skip_admin_auth).and_return(false)

    confirm(:admin_user)
    @admin = login(:admin_user)

    @user = FactoryBot.create(:user,
                              :name => 'nasty user 123',
                              :ban_text => 'You are banned')
  end

  context 'when a user is banned' do

    it 're-editing does not change their url_name' 


  end

end

