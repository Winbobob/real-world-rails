# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe 'Editing a Public Body Category' do
  before do
    allow(AlaveteliConfiguration).to receive(:skip_admin_auth).and_return(false)

    confirm(:admin_user)
    @admin = login(:admin_user)
    @category = FactoryBot.create(:public_body_category)
  end

  it 'can edit the default locale' 


  it 'can add a translation for a single locale' 


  it 'can add a translation for multiple locales' 


end

