require 'spec_helper'

feature 'Multilingual', js: true do
  include AuthenticationWorkflow
  include WebHelper
  let(:admin_role) { Spree::Role.find_or_create_by_name!('admin') }
  let(:admin_user) { create(:user) }

  background do
    admin_user.spree_roles << admin_role
    quick_login_as admin_user
    visit spree.admin_path
  end

  it 'has two locales available' 


  it 'can switch language by params' 


  it 'fallbacks to default_locale' 

end

